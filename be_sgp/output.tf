output "be_private_sg02_id" {
  description = "ID of BE Private Security Group2"
  value       = aws_security_group.be_private_sg02.id
}

output "be_private_sg03_id" {
  description = "ID of BE Private Security Group3"
  value       = aws_security_group.be_private_sg03.id
}

output "be_public_sg01_id" {
  description = "ID of BE Public Security Group1"
  value       = aws_security_group.be_public_sg01.id
}

output "be_private_sg01_id" {
  description = "ID of BE Private Security Group1"
  value       = aws_security_group.be_private_sg01.id
}
