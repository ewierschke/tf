# create SES rule for new tenant distro list to store email in S3
resource "aws_ses_receipt_rule" "tenant_DISTRO" {
  provider = "aws.master"
  name = "${var.tenantname}_DISTRO"
  rule_set_name = "default-rule-set"
  recipients = ["${var.tenantname}_distro@${var.envdomain}"]
  enabled = true
  scan_enabled = true
  after = "virusSpamFilter"

  s3_action {
    bucket_name = "${var.envname}-mail"
    position = "1"
    object_key_prefix = "distro/${var.tenantname}_DISTRO/"
  }
}

# create SES rule for new tenant email address for account root to store email in S3
resource "aws_ses_receipt_rule" "tenant" {
  provider = "aws.master"
  name = "${var.tenantname}"
  rule_set_name = "default-rule-set"
  recipients = ["${var.tenantname}@${var.envdomain}"]
  enabled = true
  scan_enabled = true
  after = "virusSpamFilter"

  s3_action {
    bucket_name = "${var.envname}-mail"
    position = "1"
    object_key_prefix = "distro/${var.tenantname}/"
  }
}

