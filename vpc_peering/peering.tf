resource "aws_vpc_peering_connection" "fevpc_peering_bevpc" {
  vpc_id      = data.tfe_outputs.fe_network_ws.nonsensitive_values.frontend_vpc_id
  peer_vpc_id = data.tfe_outputs.be_network_ws.nonsensitive_values.backendend_vpc_id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  #   tags = {
  #     Side = "Requester"
  #   }
}

resource "aws_route" "fevpc_private_subnet02_to_bevpc_private_subnet02" {
  route_table_id            = data.tfe_outputs.fe_network_ws.nonsensitive_values.fe_private_rtb2_id
  destination_cidr_block    = data.tfe_outputs.be_network_ws.nonsensitive_values.be_private_subnet2_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "bevpc_private_subnet02_to_fevpc_private_subnet02" {
  route_table_id            = data.tfe_outputs.be_network_ws.nonsensitive_values.be_private_rtb2_id
  destination_cidr_block    = data.tfe_outputs.fe_network_ws.nonsensitive_values.fe_private_subnet2_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "fevpc_private_subnet03_to_bevpc_private_subnet03" {
  route_table_id            = data.tfe_outputs.fe_network_ws.nonsensitive_values.fe_private_rtb3_id
  destination_cidr_block    = data.tfe_outputs.be_network_ws.nonsensitive_values.be_private_subnet3_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "bevpc_private_subnet03_to_fevpc_private_subnet03" {
  route_table_id            = data.tfe_outputs.be_network_ws.nonsensitive_values.be_private_rtb3_id
  destination_cidr_block    = data.tfe_outputs.fe_network_ws.nonsensitive_values.fe_private_subnet3_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

