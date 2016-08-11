resource "aws_vpc_peering_connection" "fromtenant" {
    provider = "aws.tenant"
    peer_owner_id = "${var.masteracctid}"
    peer_vpc_id = "${var.mastervpcid}"
    vpc_id = "${var.tenantvpcid}"

    tags { 
     Name = "${var.tenantnamedash} <-> ${var.envname}" 
    }
}

#output "peeringid" {
#  value = "${aws_vpc_peering_connection.fromtenant.id}"
#}

resource "aws_route_table" "r" {
    provider = "aws.tenant"
    vpc_id = "${var.tenantvpcid}"
    route {
        cidr_block = "${var.peertargetcidr}"
        vpc_peering_connection_id = "${aws_vpc_peering_connection.fromtenant.id}"
    }
}

