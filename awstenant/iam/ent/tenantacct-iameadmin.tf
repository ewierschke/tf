resource "aws_iam_role_policy" "tenanteadminpolicy" {
    provider = "aws.tenant"
    name = "E_ADMINISTRATOR_POL"
    role = "${aws_iam_role.tenanteadminrole.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "tenanteadminrole" {
    provider = "aws.tenant"
    name = "E_ADMINISTRATOR"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.masteracctid}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

