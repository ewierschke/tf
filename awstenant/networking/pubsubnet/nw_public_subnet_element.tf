resource "aws_subnet" "pubsub" {
    provider = "aws.tenant"
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidrblock}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Public-${var.tenantname}-${var.availability_zone}"
        Network = "Public"
    }
}

resource "aws_route_table_association" "pubrtb" {
    provider = "aws.tenant"
    subnet_id = "${aws_subnet.pubsub.id}"
    route_table_id = "${var.route_table_id}"
}

output "PublicSubnetId" {
  value = "${aws_subnet.pubsub.id}"
}

output "PublicSubnetCIDR" {
  value = "${aws_subnet.pubsub.cidr_block}"
}

output "AvailabilityZoneName" {
  value = "${aws_subnet.pubsub.availability_zone}"
}

