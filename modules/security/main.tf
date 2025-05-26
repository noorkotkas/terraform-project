# EC2 SSH turvagrupp
resource "aws_security_group" "ec2_ssh" {
  name        = "${var.name}-ec2-ssh"               # SG nimi
  description = "Lubab SSH ligipaasu usaldatud IP-delt"
  vpc_id      = var.vpc_id                           # VPC ID

  ingress {                                         # Sissetulev liiklus
    from_port   = 22                                # SSH port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidrs                     # Lubatud IP-de CIDR plokid
  }

  egress {                                          # Väljuv liiklus
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]                   # Kõik väljaminev
  }

  tags = { Name = "${var.name}-ec2-ssh" }
}

# RDS andmebaasi turvagrupp
resource "aws_security_group" "rds_db" {
  name        = "${var.name}-rds-db"
  description = "Lubab DB ligipaasu EC2 instantsidelt"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306                         # MySQL port
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_ssh.id] # Lubab SG kaudu
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.name}-rds-db" }
}