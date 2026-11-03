terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.4"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

variable "image_tag" {
  type    = string
  default = "v1"
}

variable "replicas" {
  type    = number
  default = 3
}

variable "port" {
  type    = number
  default = 8081
}
