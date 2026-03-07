provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project = "unl3ash-ik"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.15.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0"
    }
  }

  required_version = "~> 1.0"
}
