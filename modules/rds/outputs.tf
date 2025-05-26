output "endpoint" {
  description = "RDS lõpp-punkt (endpoint)"
  value       = aws_db_instance.this.endpoint
}
