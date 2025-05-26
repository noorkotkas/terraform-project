# RDS alamvõrkude grupp
resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags       = { Name = "${var.name}-db-subnet-group" }
}

# RDS instants
resource "aws_db_instance" "this" {
  identifier             = var.db_identifier       # Andmebaasi identifikaator
  allocated_storage      = var.allocated_storage   # Salvestusruum GB-des
  engine                 = var.engine              # Mootori tüüp (mysql jne)
  engine_version         = var.engine_version      # Mootori versioon
  instance_class         = var.instance_class      # RDS instantsi klass
  username               = var.username            # Admin kasutajanimi
  password               = var.password            # Parool
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.security_group_ids  # RDS turvagrup ID-d
  publicly_accessible    = false                   # Pole avalik
  skip_final_snapshot    = true                    # Ei loo lõplikku snapshot'i

  tags = { Name = "${var.name}-rds-instance" }
}