module "cloudtrail" {
    source = "./awstenant/cloudtrail"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    envname = "${var.envname1}"
}

module "networking" {
    source = "./awstenant/networking"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    vpccidrblock = "${var.vpccidrblock1}"
    tenantname = "${var.tenantname1}"
    peereddomaindnsname = "${var.peereddomaindnsname1}"
    peereddc1name = "${var.peereddc1name1}"
    peereddc1ip = "${var.peereddc1ip1}"
    peereddc2name = "${var.peereddc2name1}"
    peereddc2ip = "${var.peereddc2ip1}"
    envname = "${var.envname1}"
    peertargetcidr = "${var.peertargetcidr1}"
    masteracctid = "${var.masteracctid1}"
    mastervpcid = "${var.mastervpcid1}"
    tenantnamedash = "${var.tenantnamedash1}"
    pubsub1acidr = "${var.pubsub1acidr1}"
    pubsub2acidr = "${var.pubsub2acidr1}"
    pubsub3acidr = "${var.pubsub3acidr1}"
    privsub1acidr = "${var.privsub1acidr1}"
    privsub2acidr = "${var.privsub2acidr1}"
    privsub3acidr = "${var.privsub3acidr1}"
}

module "tenantiament" {
    source = "./awstenant/iam/ent"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    masteracctid = "${var.masteracctid1}"
    tenantacctid = "${var.tenantacctid1}"
    tenantnamedash = "${var.tenantnamedash1}"
}

module "tenantiamresource" {
    source = "./awstenant/iam/resource"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    masteracctid = "${var.masteracctid1}"
    tenantacctid = "${var.tenantacctid1}"
    tenantnamedash = "${var.tenantnamedash1}"
}

