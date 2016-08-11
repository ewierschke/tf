provider "aws" {
  alias = "master"
  access_key = "${var.master_access_key}"
  secret_key = "${var.master_secret_key}"
  region     = "${var.aws_region}"
}

variable "tenantname" {}
variable "master_access_key" {}
variable "master_secret_key" {}
variable "aws_region" {}
variable "envname" {}
variable "envdomain" {}
