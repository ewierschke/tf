resource "aws_subnet" "main" {
    provider = "aws.tenant"
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.cidrblock}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "Public-${var.tenantname}-${var.availability_zone}"
        Network = "Public"
    }
}

resource "aws_route_table_association" "a" {
    provider = "aws.tenant"
    subnet_id = "${aws_subnet.main.id}"
    route_table_id = "${var.route_table_id}"
}

output "PublicSubnetId" {
  value = "${aws_subnet.main.id}"
}

output "PublicSubnetCIDR" {
  value = "${aws_subnet.main.cidr_block}"
}

output "AvailabilityZoneName" {
  value = "${aws_subnet.main.availability_zone}"
}

