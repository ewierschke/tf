resource "aws_nat_gateway" "gw" {
    provider = "aws.tenant"
    allocation_id = "${aws_eip.lb.id}"
    subnet_id = "${var.pubsubid}"
}

resource "aws_eip" "lb" {
    provider = "aws.tenant"
    vpc = true
}

resource "aws_route_table" "r" {
    provider = "aws.tenant"
    vpc_id = "${var.vpc_id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw.id}"
    }

    tags {
        Name = "Private-${var.tenantname}-rtb"
    }
}
output "PrivateRouteTableId" {
  value = "${aws_route_table.r.id}"
}

output "NATGatewayElasticIP" {
  value = "${aws_eip.lb.public_ip}"
}

