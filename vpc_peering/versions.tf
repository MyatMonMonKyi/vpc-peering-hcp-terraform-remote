terraform {
  required_version = "1.16.6"

  cloud {

    organization = "mk-hc-tfc"

    workspaces {
      name = "vpc_peering"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
  }
}

