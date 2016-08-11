provider "aws" {
  alias = "tenant"
  access_key = "${var.tenant_access_key}"
  secret_key = "${var.tenant_secret_key}"
  region     = "${var.aws_region}"
}


resource "aws_vpc" "main" {
    provider = "aws.tenant"
    cidr_block = "${var.cidrblock}"
    enable_dns_support = true
    enable_dns_hostnames = true
    
    tags {
      Name = "${var.tenantname}-vpc"
    }
}

resource "aws_internet_gateway" "gw" {
    provider = "aws.tenant"
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "${var.tenantname}-igw"
    }
}

resource "aws_route_table" "r" {
    provider = "aws.tenant"
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
        Name = "Public-${var.tenantname}-rtb"
    }
}

output "VPC" {
  value = "${aws_vpc.main.id}"
}

output "VPCCIDR" {
  value = "${aws_vpc.main.cidr_block}"
}

output "InternetGatewayId" {
  value = "${aws_internet_gateway.gw.id}"
}

output "PublicRouteTableId" {
  value = "${aws_route_table.r.id}"
}

