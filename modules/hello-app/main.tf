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

variable "namespace" {
  type = string
}

resource "kubernetes_namespace_v1" "env" {
  metadata {
    name = var.namespace
  }
}

variable "port" {
  type    = number
  default = 8081
}

  metadata {
    name      = "hello-app"
    namespace = kubernetes_namespace_v1.env.metadata[0].name
  }

module "hello" {
  source    = "../../modules/hello-app"
  namespace = "dev"
  port      = 8080
}
