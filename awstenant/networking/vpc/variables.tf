provider "aws" {
  alias = "tenant"
  access_key = "${var.tenant_access_key}"
  secret_key = "${var.tenant_secret_key}"
  region     = "${var.aws_region}"
}

variable "aws_region" {}
variable "tenantname" {}
variable "tenant_access_key" {}
variable "tenant_secret_key" {}
variable "vpccidrblock" {}

