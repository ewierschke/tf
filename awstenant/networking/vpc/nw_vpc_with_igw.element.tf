resource "aws_vpc" "tenant" {
    provider = "aws.tenant"
    cidr_block = "${var.vpccidrblock}"
    enable_dns_support = true
    enable_dns_hostnames = true
    
    tags {
      Name = "${var.tenantname}-vpc"
    }
}

resource "aws_internet_gateway" "igw" {
    provider = "aws.tenant"
    vpc_id = "${aws_vpc.tenant.id}"

    tags {
        Name = "${var.tenantname}-igw"
    }
}

resource "aws_route_table" "pub" {
    provider = "aws.tenant"
    vpc_id = "${aws_vpc.tenant.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }

    tags {
        Name = "Public-${var.tenantname}-rtb"
    }
}

output "VPC" {
  value = "${aws_vpc.tenant.id}"
}

output "VPCCIDR" {
  value = "${aws_vpc.tenant.cidr_block}"
}

output "InternetGatewayId" {
  value = "${aws_internet_gateway.igw.id}"
}

output "PublicRouteTableId" {
  value = "${aws_route_table.pub.id}"
}

