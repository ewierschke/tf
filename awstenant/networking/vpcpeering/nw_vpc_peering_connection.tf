resource "aws_vpc_peering_connection" "peerfromtenant" {
    provider = "aws.tenant"
    peer_owner_id = "${var.masteracctid}"
    peer_vpc_id = "${var.mastervpcid}"
    vpc_id = "${var.tenantvpcid}"

    tags { 
     Name = "${var.tenantnamedash} <-> ${var.envname}" 
    }
}

resource "aws_route" "priv" {
    provider = "aws.tenant"
    route_table_id = "${var.privroutetable}"
    destination_cidr_block = "${var.peertargetcidr}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.peerfromtenant.id}"
#    depends_on = ["aws_route_table.testing"]
}

resource "aws_route" "pub" {
    provider = "aws.tenant"
    route_table_id = "${var.pubroutetable}"
    destination_cidr_block = "${var.peertargetcidr}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.peerfromtenant.id}"
#    depends_on = ["aws_route_table.testing"]
}

