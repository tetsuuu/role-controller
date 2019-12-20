data "aws_caller_identity" "self" {}

variable "service_name" {
  default = "njss3"
}

variable "short_env" {
  default = "stg"
}

variable "region" {
  default = "ap-northeast-1"
}

provider "aws" {
  region  = "${var.region}"
  version = "~> 2.14.0"
}
