resource "aws_iam_role_policy" "tenanttechreadonlypolicy" {
    provider = "aws.tenant"
    name = "T_TECHREADONLY_U_POL"
    role = "${aws_iam_role.tenanttechreadonlyrole.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow", 
      "Action": [         
        "autoscaling:Describe*",
        "aws-portal:View*",
        "cloudformation:Describe*",
        "cloudformation:EstimateTemplateCost",
        "cloudformation:Get*",
        "cloudformation:List*",
        "cloudformation:PreviewStackUpdate",
        "cloudformation:ValidateTemplate",
        "cloudhsm:Describe*",
        "cloudhsm:Get*",
        "cloudhsm:List*",
        "cloudtrail:Describe*",
        "cloudtrail:Get*",
        "cloudtrail:Lookup*",
        "cloudwatch:Describe*",
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "logs:Describe*",
        "logs:Get*",
        "logs:Test*",
        "directconnect:Describe*",
        "dynamodb:ListTables",
        "dynamodb:DescribeTable",
        "ec2:Describe*",
        "ec2:GetConsoleOutput",
        "ec2-reports:View*",
        "elasticloadbalancing:Describe*",
        "elasticmapreduce:Describe*",
        "elasticmapreduce:List*",
        "glacier:Describe*",
        "glacier:Get*",
        "glacier:List*",
        "iam:GenerateCredentialReport",
        "iam:Get*",
        "iam:List*",
        "kinesis:Describe*",
        "kinesis:List*",
        "kms:Describe*",
        "kms:GetKeyPolicy",
        "kms:GetKeyRotationStatus",
        "kms:List*",
        "aws-marketplace:View*",
        "rds:Describe*",
        "rds:List*",
        "redshift:Describe*",
        "redshift:List*",
        "s3:GetBucket*",
        "s3:GetLifecycle*",
        "s3:GetObjectAcl",
        "s3:GetObjectVersionAcl",
        "s3:List*",
        "sns:Get*",
        "sns:List*",
        "sqs:Get*",
        "sqs:List*",
        "swf:Count*",
        "swf:Describe*",
        "swf:Get*",
        "swf:List*" 
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
        "trustedadvisor:Exclude*",
        "trustedadvisor:Include*",
        "trustedadvisor:Refresh*",
        "trustedadvisor:Describe*" 
      ],
      "Resource": [
        "arn:aws:trustedadvisor:*:*:checks/cost_optimizing/*" 
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
        "arn:aws:trustedadvisor:*:*:checks/performance/*" 
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
        "arn:aws:trustedadvisor:*:*:checks/fault_tolerance/*" 
      ]
    },
    {
      "Effect": "Deny", 
      "Action": [         
        "kms:CancelKeyDeletion",
        "kms:Create*",
        "kms:Delete*",
        "kms:Disable*",
        "kms:Enable*",
        "kms:Put*",
        "kms:RetireGrant",
        "kms:Revoke*",
        "kms:ScheduleKeyDeletion",
        "kms:Update*",
        "kms:Decrypt*",
        "kms:Encrypt*",
        "kms:Generate*",
        "kms:ReEncrypt*" 
      ],
      "Resource": [
        "*"      ]
    }
  ] 
} 
EOF
}

resource "aws_iam_role" "tenanttechreadonlyrole" {
    provider = "aws.tenant"
    name = "T_TECHREADONLY_U"
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

