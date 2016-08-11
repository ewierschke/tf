resource "aws_iam_role_policy" "tenantebuspolicy" {
    provider = "aws.tenant"
    name = "E_BUSINESS_POL"
    role = "${aws_iam_role.tenantebusrole.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow", 
      "Action": [         
        "aws-portal:ModifyBilling",
        "aws-portal:View*",
        "cloudwatch:*",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeReservedInstances",
        "ec2:DescribeReservedInstancesOfferings",
        "ec2:ModifyReservedInstances",
        "ec2:PurchaseReservedInstancesOfferings",
        "s3:ListAllMyBuckets",
        "sns:Get*",
        "sns:List*",
        "support:*" 
      ],
      "Resource": [
        "*"      ]
    },
    {
      "Effect": "Allow", 
      "Action": [         
        "s3:Get*",
        "s3:List*" 
      ],
      "Resource": [
        "arn:aws:s3:::*billing*",
        "arn:aws:s3:::*billing*/*"      ]
    },
    {
      "Effect": "Allow", 
      "Action": [         
        "sns:*" 
      ],
      "Resource": [
        "arn:aws:sns:*:*:aws_budget" 
      ]
    },
    {
      "Effect": "Allow", 
      "Action": [         
        "trustedadvisor:Exclude*",
        "trustedadvisor:Include*",
        "trustedadvisor:Refresh*",
        "trustedadvisor:Describe*" 
      ],
      "Resource": [
        "arn:aws:trustedadvisor:*:*:checks/cost_optimizing/*" 
      ]
    }
  ] 
} 
EOF
}

resource "aws_iam_role" "tenantebusrole" {
    provider = "aws.tenant"
    name = "E_BUSINESS"
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

