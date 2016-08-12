module "masteracctses" {
    source = "./awsmaster/ses"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    master_access_key = "${var.master_access_key1}"
    master_secret_key = "${var.master_secret_key1}"
    envname = "${var.envname1}"
    envdomain = "${var.envdomain1}"
}

module "masteracctiam" {
    source = "./awsmaster/iam"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    master_access_key = "${var.master_access_key1}"
    master_secret_key = "${var.master_secret_key1}"
    envname = "${var.envname1}"
    tenantacctid = "${var.tenantacctid1}"
}


