output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "Avalike alamvõrkude ID-d"
  value       = aws_subnet.public[*].id
}
