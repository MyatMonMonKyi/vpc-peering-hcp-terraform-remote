output "frontend_vpc_id" {
  description = "VPC ID of frontend VPCs"
  value       = aws_vpc.frontend_vpc.id
}

output "fe_private_rtb2_id" {
  description = "ID of FE private rtb2"
  value       = aws_route_table.frontend_private_rtb02.id
}

output "fe_private_rtb3_id" {
  description = "ID of FE private rtb2"
  value       = aws_route_table.frontend_private_rtb03.id
}

output "fe_private_subnet2_cidr" {
  description = "CIDR of FE private subnet2"
  value       = var.frontend_private_subnet_cidr[1]
}

output "fe_private_subnet3_cidr" {
  description = "CIDR of FE private subnet2"
  value       = var.frontend_private_subnet_cidr[2]
}

output "fe_private_subnet1_id" {
  description = "ID of FE private subnet1"
  value       = aws_subnet.frontend_private_subnet01.id
}

output "fe_private_subnet2_id" {
  description = "ID of FE private subnet2"
  value       = aws_subnet.frontend_private_subnet02.id
}

output "fe_private_subnet3_id" {
  description = "ID of FE private subnet3"
  value       = aws_subnet.frontend_private_subnet03.id
}

output "fe_public_subnet1_id" {
  description = "ID of FE public subnet1"
  value       = aws_subnet.frontend_public_subnet01.id
}