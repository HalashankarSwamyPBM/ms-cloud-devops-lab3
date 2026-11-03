terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "dev_environment" {
  filename = "${path.module}/dev.txt"
  content  = "Development environment created using Terraform."
}
