# Peamine konfiguratsioon moodulite ühendamiseks
module "vpc" {
  source         = "./modules/vpc"
  name           = "example"
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_azs     = ["eu-north-1a", "eu-north-1b"]
}

module "security" {
  source     = "./modules/security"
  name       = "example"
  vpc_id     = module.vpc.vpc_id
  ssh_cidrs  = ["203.0.113.25/32"]  # Asenda enda IP-ga
}

module "ec2" {
  source             = "./modules/ec2"
  name               = "example"
  ami                = data.aws_ssm_parameter.amzn2_ami.value
  instance_type      = "t3.micro"
  subnet_id          = module.vpc.public_subnets[0]
  security_group_ids = [module.security.ec2_ssh_sg_id]
  key_name           = aws_key_pair.main.key_name
  public_key_path    = "~/.ssh/id_rsa.pub"
}

module "rds" {
  source              = "./modules/rds"
  name                = "example"
  db_identifier       = "exampledb"
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  username            = "admin"
  password            = "Parool1!"
  subnet_ids          = module.vpc.public_subnets
  security_group_ids  = [module.security.rds_db_sg_id]
}

module "monitoring" {
  source            = "./modules/monitoring"
  name              = "example"
  alert_email       = "youremail@example.com"
  ec2_instance_id   = module.ec2.instance_id
  evaluation_periods= 2
  period            = 300
  threshold         = 70
}

# Vajalikud andmeallikad ja ressursid
# Toob uusima Amazon Linux AMI

data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# SSH võtmepargi loomine juures
resource "aws_key_pair" "main" {
  key_name   = "main-key"
  public_key = file("~/.ssh/id_rsa.pub")
}