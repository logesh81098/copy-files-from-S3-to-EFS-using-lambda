output "efs-sg-id" {
  value = aws_security_group.efs-security-group.id
}

output "ec-sg-id" {
  value = aws_security_group.ec2-sg.id
}