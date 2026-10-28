output "fe_private_sg02_id" {
  description = "ID of FE Private Security Group2"
  value       = aws_security_group.fe_private_sg02.id
}

output "fe_private_sg03_id" {
  description = "ID of FE Private Security Group3"
  value       = aws_security_group.fe_private_sg03.id
}

output "fe_public_sg01_id" {
  description = "ID of FE Public Security Group1"
  value       = aws_security_group.fe_public_sg01.id
}

output "fe_private_sg01_id" {
  description = "ID of FE Private Security Group1"
  value       = aws_security_group.fe_private_sg01.id
}