terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  alias  = "replica"
}

provider "aws" {
  access_key = "AKIASFI5CKBB5CJPI2VY"
  secret_key = "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"
}