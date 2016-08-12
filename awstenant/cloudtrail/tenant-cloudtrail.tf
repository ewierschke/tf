resource "aws_cloudtrail" "tenantcloudtrail" {
    provider = "aws.tenant"
    name = "${var.tenantname}-cloudtrail"
    s3_bucket_name = "${var.envname}-cloudtrail"
    include_global_service_events = true
    is_multi_region_trail = true
    enable_log_file_validation = true
}
