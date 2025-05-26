# VPC loomine
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr                # VPC IP plokk
  enable_dns_support   = true                        # Luba DNS tugi
  enable_dns_hostnames = true                        # Luba DNS hostinimed
  tags = { Name = var.name }                         # Silt nimega
}

# Avalike alamvõrkude loomine
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)       # Mitme alamvõrgu loomiseks
  vpc_id                  = aws_vpc.this.id                  # VPC ID
  cidr_block              = var.public_subnets[count.index] # Alamvõrgu IP plokk
  availability_zone       = var.public_azs[count.index]      # Saadavuspiirkond
  map_public_ip_on_launch = true                            # Avalik IP automaatselt
  tags = { Name = "${var.name}-public-${count.index + 1}" } # Silt
}

# Internet Gateway ühendamiseks
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id              # VPC, kuhu ühendada
  tags   = { Name = "${var.name}-igw" } # Silt
}

# Avaliku marsruuditabeli loomine
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id               # VPC
  route {                                # Marsruut internetti
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = { Name = "${var.name}-public-rt" }
}

# Alamvõrkude sidumine marsruuditabeliga
resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}