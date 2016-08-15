provider "aws" {
  alias = "tenant"
  access_key = "${var.tenant_access_key}"
  secret_key = "${var.tenant_secret_key}"
  region     = "${var.aws_region}"
}

variable "aws_region" {}
variable "tenant_access_key" {}
variable "tenant_secret_key" {}
variable "tenantname" {}
variable "peereddomaindnsname" {}
variable "peereddc1name" {}
variable "peereddomaindnsname" {}
variable "peereddc1ip" {}
variable "peereddc2name" {}
variable "peereddc2ip" {}
variable "vpccidrblock" {}
variable "envname" {}
variable "peertargetcidr" {}
variable "masteracctid" {}
variable "mastervpcid" {}
variable "tenantnamedash" {}
variable "pubsub1acidr" {}
variable "pubsub2acidr" {}
variable "pubsub3acidr" {}
variable "privsub1acidr" {}
variable "privsub2acidr" {}
variable "privsub3acidr" {}

