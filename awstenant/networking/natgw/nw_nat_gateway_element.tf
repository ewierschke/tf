resource "aws_nat_gateway" "natgw" {
    provider = "aws.tenant"
    allocation_id = "${aws_eip.natgweip.id}"
    subnet_id = "${var.pubsubid}"
}

resource "aws_eip" "natgweip" {
    provider = "aws.tenant"
    vpc = true
}

resource "aws_route_table" "privsub" {
    provider = "aws.tenant"
    vpc_id = "${var.vpc_id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.natgw.id}"
    }

    tags {
        Name = "Private-${var.tenantname}-rtb"
    }
}
output "PrivateRouteTableId" {
  value = "${aws_route_table.privsub.id}"
}

output "NATGatewayElasticIP" {
  value = "${aws_eip.natgweip.public_ip}"
}

