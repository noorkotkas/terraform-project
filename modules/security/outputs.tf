output "ec2_ssh_sg_id" {
  description = "EC2 SSH SG ID"
  value       = aws_security_group.ec2_ssh.id
}
output "rds_db_sg_id" {
  description = "RDS DB SG ID"
  value       = aws_security_group.rds_db.id
}
