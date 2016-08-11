resource "aws_iam_role_policy" "tenantclapperpolicy" {
    provider = "aws.tenant"
    name = "CLAPPER_POL"
    role = "${aws_iam_role.tenantclapperrole.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
     "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:CreateTags",
                "ec2:DeleteTags",
                "cloudwatch:*" 
            ],
            "Resource": "*" 
        },
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::*:role/CLAPPER" 
        },
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::*:role/E_BUSINESS" 
        }
    ]
} 
EOF
}

resource "aws_iam_role" "tenantclapperrole" {
    provider = "aws.tenant"
    name = "CLAPPER"
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

