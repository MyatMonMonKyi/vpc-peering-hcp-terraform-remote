output "backendend_vpc_id" {
  description = "VPC ID of backend VPCs"
  value       = aws_vpc.backend_vpc.id
}

output "be_private_rtb2_id" {
  description = "ID of BE private rtb2"
  value       = aws_route_table.backend_private_rtb02.id
}

output "be_private_rtb3_id" {
  description = "ID of BE private rtb3"
  value       = aws_route_table.backend_private_rtb03.id
}

output "be_private_subnet2_cidr" {
  description = "CIDR of BE private subnet2"
  value       = var.backend_private_subnet_cidr[1]
}

output "be_private_subnet3_cidr" {
  description = "CIDR of BE private subnet2"
  value       = var.backend_private_subnet_cidr[2]
}

output "be_private_subnet1_id" {
  description = "ID of BE private subnet1"
  value       = aws_subnet.backend_private_subnet01.id
}

output "be_private_subnet2_id" {
  description = "ID of BE private subnet2"
  value       = aws_subnet.backend_private_subnet02.id
}

output "be_private_subnet3_id" {
  description = "ID of BE private subnet3"
  value       = aws_subnet.backend_private_subnet03.id
}

output "be_public_subnet1_id" {
  description = "ID of BE public subnet1"
  value       = aws_subnet.backend_public_subnet01.id
}

