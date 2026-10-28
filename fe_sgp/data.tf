data "tfe_outputs" "fe_network_ws" {
  workspace    = var.fe_network_workspace_name
  organization = var.organization_name
}

data "tfe_outputs" "be_sgp_ws" {
  workspace    = var.be_sgp_workspace_name
  organization = var.organization_name
}