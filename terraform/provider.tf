terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.44"
    }
  }

  backend "s3" {
      bucket     = "tf-remote-state20210901011426035100000002"
      key        = "danielm/177043759486/terraform.tfstate"
      region     = "us-east-1"
      encrypt    = true
      kms_key_id = "b90f0db1-6d30-43b2-8e63-845c98db00b6"
    }
}

# Configure the Okta Provider
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  api_token = var.api_token
}