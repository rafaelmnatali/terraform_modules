terraform {
  required_version = ">=0.11"
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

variable "env" {}
variable "default_aws_region" {}

provider "aws" {
  region  = "${var.default_aws_region}"
  version = "~> 1.20"
}

variable "cidr_block" {}

resource "aws_vpc" "selected" {
  cidr_block  = "${var.cidr_block}"

  tags {
    Name = "vpc-${var.env}"
    Provider  = "Terraform"
    Environment = "${var.env}"
  }
}
