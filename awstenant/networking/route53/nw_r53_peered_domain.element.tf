resource "aws_route53_zone" "privatehostedzone" {
  provider = "aws.tenant"
  name = "${var.peereddomaindnsname}"
  comment = "Zone for ${var.peereddomaindnsname}"
  tags {
    Name = "${var.tenantname}"
  }
  vpc_id = "${var.vpc_id}"
}

resource "aws_route53_record" "peereddcarecordset1" {
  provider = "aws.tenant"
  zone_id = "${aws_route53_zone.privatehostedzone.zone_id}"
  name = "${var.peereddc1name}.${var.peereddomaindnsname}"
  type = "A"
  ttl = "300"
  records = [
      "${var.peereddc1ip}"
  ]
  depends_on = ["aws_route53_zone.privatehostedzone"]
}

resource "aws_route53_record" "peereddcsrvrecordset1" {
  provider = "aws.tenant"
  zone_id = "${aws_route53_zone.privatehostedzone.zone_id}"
  name = "_ldap._tcp.dc._msdcs.${var.peereddomaindnsname}"
  type = "SRV"
  ttl = "300"
  records = [
      "0 100 389 ${var.peereddc1name}.${var.peereddomaindnsname}."
  ]
  set_identifier = "${var.peereddc1name}.${var.tenantname}."
  weighted_routing_policy { 
    weight = 20 
  }
  depends_on = ["aws_route53_zone.privatehostedzone"]
}

resource "aws_route53_record" "peereddomainarecordset1" {
  provider = "aws.tenant"
  zone_id = "${aws_route53_zone.privatehostedzone.zone_id}"
  name = "${var.peereddomaindnsname}."
  type = "A"
  ttl = "300"
  records = [
      "${var.peereddc1ip}"
  ]
  set_identifier = "${var.peereddc1name}.${var.tenantname}."
  weighted_routing_policy {
    weight = 20 
  }
  depends_on = ["aws_route53_zone.privatehostedzone"]
}

resource "aws_route53_record" "peereddcarecordset2" {
  provider = "aws.tenant"
  zone_id = "${aws_route53_zone.privatehostedzone.zone_id}"
  name = "${var.peereddc2name}.${var.peereddomaindnsname}"
  type = "A"
  ttl = "300"
  records = [
      "${var.peereddc2ip}"
  ]
  depends_on = ["aws_route53_zone.privatehostedzone"]
}

resource "aws_route53_record" "peereddcsrvrecordset2" {
  provider = "aws.tenant"
  zone_id = "${aws_route53_zone.privatehostedzone.zone_id}"
  name = "_ldap._tcp.dc._msdcs.${var.peereddomaindnsname}"
  type = "SRV"
  ttl = "300"
  records = [
      "0 100 389 ${var.peereddc2name}.${var.peereddomaindnsname}."
  ]
  set_identifier = "${var.peereddc2name}.${var.tenantname}."
  weighted_routing_policy {
    weight = 20 
  }
  depends_on = ["aws_route53_zone.privatehostedzone"]
}

resource "aws_route53_record" "peereddomainarecordset2" {
  provider = "aws.tenant"
  zone_id = "${aws_route53_zone.privatehostedzone.zone_id}"
  name = "${var.peereddomaindnsname}."
  type = "A"
  ttl = "300"
  records = [
      "${var.peereddc2ip}"
  ]
  set_identifier = "${var.peereddc2name}.${var.tenantname}."
  weighted_routing_policy {
    weight = 20
  }
  depends_on = ["aws_route53_zone.privatehostedzone"]
}

output "PrivateHostedZoneId" {
  value = "${aws_route53_zone.privatehostedzone.id}"
}

