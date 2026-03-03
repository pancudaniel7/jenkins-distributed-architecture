output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_groups.id
  description = "EC2 security groups id"
}