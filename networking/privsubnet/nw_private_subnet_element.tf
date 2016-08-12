resource "aws_subnet" "main" {
    provider = "aws.tenant"
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidrblock}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Private-${var.tenantname}-${var.availability_zone}"
        Network = "Private"
    }
}

resource "aws_route_table_association" "a" {
    provider = "aws.tenant"
    subnet_id = "${aws_subnet.main.id}"
    route_table_id = "${var.route_table_id}"
}

output "PrivateSubnetId" {
  value = "${aws_subnet.main.id}"
}

output "PrivateSubnetCIDR" {
  value = "${aws_subnet.main.cidr_block}"
}

output "AvailabilityZoneName" {
  value = "${aws_subnet.main.availability_zone}"
}

