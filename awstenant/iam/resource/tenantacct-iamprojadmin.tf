#need to revisit to potentially target specific resources created from other module rather than categories
resource "aws_iam_role_policy" "tenantprojadminpolicy" {
    provider = "aws.tenant"
    name = "T_PROJADMIN_U_POL"
    role = "${aws_iam_role.tenantprojadminrole.id}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAll",
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        },
        {
            "Sid": "DenySomeIam",
            "Effect": "Deny",
            "Action": [
                "iam:Add*",
                "iam:Attach*",
                "iam:Create*",
                "iam:Delete*",
                "iam:Detach*",
                "iam:Generate*",
                "iam:Put*",
                "iam:Remove*",
                "iam:Update*",
                "iam:Upload*"
            ],
            "Resource": [
                "arn:aws:iam::*:role/T_PROJADMIN_U",
                "arn:aws:iam::*:role/E_ADMINISTRATOR",
                "arn:aws:iam::*:role/E_BUSINESS"
            ]
        },
        {
            "Sid": "DenyUnallowedSpending",
            "Effect": "Deny",
            "Action": [
                "ec2:ModifyReservedInstances",
                "ec2:PurchaseReservedInstancesOffering",
                "aws-marketplace:Subscribe"
            ],
            "Resource": "*"
        },
        {
            "Sid": "DenyInternetGateway",
            "Effect": "Deny",
            "Action": [
                "ec2:DeleteInternetGateway"
            ],
            "Resource": "arn:aws:ec2:us-east-1:${var.tenantacctid}:internet-gateway/*"
        },
        {
            "Sid": "DenyNatGateway",
            "Effect": "Deny",
            "Action": [
                "ec2:DeleteNatGateway"
            ],
            "Resource": "*"
        },
        {
            "Sid": "DenyDeleteVpcResources",
            "Effect": "Deny",
            "Action": [
                "ec2:DeleteNetworkAcl",
                "ec2:DeleteNetworkAclEntry",
                "ec2:DeleteRoute",
                "ec2:DeleteRouteTable"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "ec2:vpc": "arn:aws:ec2:us-east-1:${var.tenantacctid}:vpc/*"
                }
            }
        },
        {
            "Sid": "DenyDeleteVpcPeering",
            "Effect": "Deny",
            "Action": "ec2:DeleteVpcPeeringConnection",
            "Resource": "arn:aws:ec2:us-east-1:${var.tenantacctid}:vpc-peering-connection/*"
        },
        {
            "Sid": "DenyDeleteVPCDefaultSG",
            "Effect": "Deny",
            "Action": [
                "ec2:DeleteSecurityGroup"
            ],
            "Resource": "arn:aws:ec2:us-east-1:${var.tenantacctid}:security-group/*"
        },
        {
            "Sid": "DenyDeleteVpc",
            "Effect": "Deny",
            "Action": "ec2:DeleteVpc",
            "Resource": "*"
        },
        {
            "Sid": "DenyDeleteTrail",
            "Effect": "Deny",
            "Action": [
                "cloudtrail:DeleteTrail",
                "cloudtrail:StopLogging"
            ],
            "Resource": [
                "arn:aws:cloudtrail:us-east-1:${var.tenantacctid}:trail/${var.tenantnamedash}-cloudtrail"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role" "tenantprojadminrole" {
    provider = "aws.tenant"
    name = "T_PROJADMIN_U"
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

