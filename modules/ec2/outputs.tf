output "instance_id" {
  description = "EC2 instantsi ID"
  value       = aws_instance.this.id
}
output "public_ip" {
  description = "EC2 avalik IP"
  value       = aws_instance.this.public_ip
}
