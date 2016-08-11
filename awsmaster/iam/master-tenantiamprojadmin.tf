resource "aws_iam_role_policy" "mastertenantprojadminpolicy" {
    provider = "aws.master"
    name = "T_${var.tenantname}_PROJADMIN_U_POL"
    role = "${aws_iam_role.mastertenantprojadminrole.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::${var.tenantacctid}:role/T_PROJADMIN_U"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "arn:aws:s3:::${var.envname}-cloudtail/AWSLogs/${var.tenantacctid}/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "arn:aws:s3:::${var.envname}-cloudtrail"
        }
    ]
}
EOF
}

resource "aws_iam_role" "mastertenantprojadminrole" {
    provider = "aws.master"
    name = "T_${var.tenantname}_PROJADMIN_U"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ds.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
