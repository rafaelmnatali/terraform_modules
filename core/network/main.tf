terraform {
  required_version = ">=0.11"
}

variable "aws_region" {}

provider "aws" {
  region  = "${var.aws_region}"
  version = "~> 1.20"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

variable "cidr_block" {}

resource "aws_vpc" "selected" {
  cidr_block  = "${var.cidr_block}"

  tags {
    Name = "vpc-${terraform.workspace}"
    Provider  = "Terraform"
    Workspace = "${terraform.workspace}"
  }
}