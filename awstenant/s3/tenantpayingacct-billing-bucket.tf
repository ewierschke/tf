#create billing s3 bucket in tenant account
#acct id encoded grants amazon billing service access to putobject, getbucketacl and getbucketpolicy
resource "aws_s3_bucket" "billingbucket" {
    provider = "aws.tenant"
    bucket = "${var.parentenv}-${var.tenantname}-billing"
    acl = "private"

    policy = <<EOF
{
    "Version": "2008-10-17",
    "Id": "Policy1335892530063",
    "Statement": [
        {
            "Sid": "Stmt1335892150622",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::386209384616:root" 
            },
            "Action": [
                "s3:GetBucketAcl",
                "s3:GetBucketPolicy" 
            ],
            "Resource": "arn:aws:s3:::${var.parentenv}-${var.tenantname}-billing" 
        },
        {
            "Sid": "Stmt1335892526596",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::386209384616:root" 
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.parentenv}-${var.tenantname}-billing/*" 
        }
    ]
}
EOF
 
}
