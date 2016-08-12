#module "networking" {
#    source = "./networking"
#    tenantname = "${var.tenantname1}"
#    aws_region = "${var.aws_region1}"
#    tenant_access_key = "${var.tenant_access_key1}"
#    tenant_secret_key = "${var.tenant_secret_key1}"
#    vpccidrblock = "${var.vpccidrblock1}"
#}

module "cloudtrail" {
    source = "./awstenant/cloudtrail"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    envname = "${var.envname1}"
}

#module "vpcpeering" {
#    source = "./awstenant/vpcpeering"
#    tenantname = "${var.tenantname1}"
#    aws_region = "${var.aws_region1}"
#    tenant_access_key = "${var.tenant_access_key1}"
#    tenant_secret_key = "${var.tenant_secret_key1}"
#    envname = "${var.envname1}"
#    peertargetcidr = "${var.peertargetcidr1}"
#    masteracctid = "${var.masteracctid1}"
#    mastervpcid = "${var.mastervpcid1}"
#    tenantvpcid = "${var.tenantvpcid1}"
#    tenantnamedash = "${var.tenantnamedash1}"
#}

module "tenantiament" {
    source = "./awstenant/iam/ent"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    masteracctid = "${var.masteracctid1}"
    tenantacctid = "${var.tenantacctid1}"
    tenantnamedash = "${var.tenantnamedash1}"
}

module "iamresource" {
    source = "./awstenant/iam/resource"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    masteracctid = "${var.masteracctid1}"
    tenantacctid = "${var.tenantacctid1}"
    tenantnamedash = "${var.tenantnamedash1}"
}

