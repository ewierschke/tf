provider "aws" {
  alias = "tenant"
  access_key = "${var.tenant_access_key}"
  secret_key = "${var.tenant_secret_key}"
  region     = "${var.aws_region}"
}

variable "tenant_access_key" {}
variable "tenant_secret_key" {}
variable "aws_region" {}
variable "peereddomaindnsname" {}
variable "tenantname" {}
variable "vpc_id" {}
variable "peereddc1name" {}
variable "peereddomaindnsname" {}
variable "peereddc1ip" {}
variable "peereddc2name" {}
variable "peereddc2ip" {}

