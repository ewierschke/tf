data "aws_availability_zones" "available" {
    provider = "aws.tenant"
}

module "vpc_igw" {
    source = "./vpc"
    tenantname = "${var.tenantname}"
    aws_region = "${var.aws_region}"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    vpccidrblock = "${var.vpccidrblock}"
}

module "pubsubnet1" {
    source = "./pubsubnet"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    cidrblock = "${var.pubsub1acidr}"
    route_table_id = "${module.vpc_igw.PublicRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname}"
}

module "pubsubnet2" {
    source = "./pubsubnet"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
    cidrblock = "${var.pubsub2acidr}"
    route_table_id = "${module.vpc_igw.PublicRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname}"
}

module "pubsubnet3" {
    source = "./pubsubnet"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"
    cidrblock = "${var.pubsub3acidr}"
    route_table_id = "${module.vpc_igw.PublicRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname}"
}

module "natgw" {
    source = "./natgw"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
#    depends_on = ["module.vpc_igw"]
    pubsubid = "${module.pubsubnet1.PublicSubnetId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname}"
}

module "privsubnet1" {
    source = "./privsubnet"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    cidrblock = "${var.privsub1acidr}"
    route_table_id = "${module.natgw.PrivateRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname}"
}

module "privsubnet2" {
    source = "./privsubnet"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
    cidrblock = "${var.privsub2acidr}"
    route_table_id = "${module.natgw.PrivateRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname}"
}

module "privsubnet3" {
    source = "./privsubnet"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"
    cidrblock = "${var.privsub3acidr}"
    route_table_id = "${module.natgw.PrivateRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname}"
}

module "route53zone" {
    source = "./route53"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    aws_region = "${var.aws_region}"
    tenantname = "${var.tenantname}"
    vpc_id = "${module.vpc_igw.VPC}"
    peereddomaindnsname = "${var.peereddomaindnsname}"
    peereddc1name = "${var.peereddc1name}"
    peereddc1ip = "${var.peereddc1ip}"
    peereddc2name = "${var.peereddc2name}"
    peereddc2ip = "${var.peereddc2ip}"
}

module "vpcpeering" {
    source = "./vpcpeering"
    tenantname = "${var.tenantname}"
    aws_region = "${var.aws_region}"
    tenant_access_key = "${var.tenant_access_key}"
    tenant_secret_key = "${var.tenant_secret_key}"
    envname = "${var.envname}"
    peertargetcidr = "${var.peertargetcidr}"
    masteracctid = "${var.masteracctid}"
    mastervpcid = "${var.mastervpcid}"
    tenantvpcid = "${module.vpc_igw.VPC}"
    tenantnamedash = "${var.tenantnamedash}"
    pubroutetable = "${module.vpc_igw.PublicRouteTableId}"
    privroutetable = "${module.natgw.PrivateRouteTableId}"
}

