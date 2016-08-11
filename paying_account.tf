module "billingbucket" {
    source = "./awstenant/s3"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    parentenv = "${var.parentenv1}"
}

module "iament" {
    source = "./awstenant/iam/ent"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    masteracctid = "${var.masteracctid1}"
    tenantacctid = "${var.tenantacctid1}"
    tenantnamedash = "${var.tenantnamedash1}"
}

