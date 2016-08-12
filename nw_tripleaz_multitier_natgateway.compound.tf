provider "aws" {
  alias = "tenant"
  access_key = "${var.tenant_access_key1}"
  secret_key = "${var.tenant_secret_key1}"
  region     = "${var.aws_region1}"
}


data "aws_availability_zones" "available" {
    provider = "aws.tenant"
}

module "vpc_igw" {
    source = "./networking/vpc"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    vpccidrblock = "${var.vpccidrblock1}"
}

module "pubsubnet1" {
    source = "./networking/pubsubnet"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    cidrblock = "${var.pubsub1acidr}"
    route_table_id = "${module.vpc_igw.PublicRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname1}"
}

module "pubsubnet2" {
    source = "./networking/pubsubnet"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
    cidrblock = "${var.pubsub2acidr}"
    route_table_id = "${module.vpc_igw.PublicRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname1}"
}

module "pubsubnet3" {
    source = "./networking/pubsubnet"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"
    cidrblock = "${var.pubsub3acidr}"
    route_table_id = "${module.vpc_igw.PublicRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname1}"
}

module "natgw" {
    source = "./networking/natgw"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
#    depends_on = ["module.vpc_igw"]
    pubsubid = "${module.pubsubnet1.PublicSubnetId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname1}"
}

module "privsubnet1" {
    source = "./networking/privsubnet"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    cidrblock = "${var.privsub1acidr}"
    route_table_id = "${module.natgw.PrivateRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname1}"
}

module "privsubnet2" {
    source = "./networking/privsubnet"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
    cidrblock = "${var.privsub2acidr}"
    route_table_id = "${module.natgw.PrivateRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname1}"
}

module "privsubnet3" {
    source = "./networking/privsubnet"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"
    cidrblock = "${var.privsub3acidr}"
    route_table_id = "${module.natgw.PrivateRouteTableId}"
    vpc_id = "${module.vpc_igw.VPC}"
    tenantname = "${var.tenantname1}"
}

module "route53zone" {
    source = "./networking/route53"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    aws_region = "${var.aws_region1}"
    tenantname = "${var.tenantname1}"
    vpc_id = "${module.vpc_igw.VPC}"
    peereddomaindnsname = "${var.peereddomaindnsname1}"
    peereddc1name = "${var.peereddc1name1}"
    peereddc1ip = "${var.peereddc1ip1}"
    peereddc2name = "${var.peereddc2name1}"
    peereddc2ip = "${var.peereddc2ip1}"
}

module "vpcpeering" {
    source = "./awstenant/vpcpeering"
    tenantname = "${var.tenantname1}"
    aws_region = "${var.aws_region1}"
    tenant_access_key = "${var.tenant_access_key1}"
    tenant_secret_key = "${var.tenant_secret_key1}"
    envname = "${var.envname1}"
    peertargetcidr = "${var.peertargetcidr1}"
    masteracctid = "${var.masteracctid1}"
    mastervpcid = "${var.mastervpcid1}"
    tenantvpcid = "${module.vpc_igw.VPC}"
    tenantnamedash = "${var.tenantnamedash1}"
}

