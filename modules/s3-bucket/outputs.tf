# HACK: Since our s3 module is supposed to be able to provision with or with out CORS rules we need to
# use 'count' to dynamically choose between the two since terraform does not support passing in complex types (https://github.com/hashicorp/terraform/issues/7705#issuecomment-300564571).
# Additionally Terraform does not support adding CORS rules as a separate resource (https://github.com/hashicorp/terraform/issues/8961).
# Since we are using count we need to use a splat syntax to access the outputs we want otherwise we get warnings.
# Since we are using the splat syntax, a list is outputted and list values can't be used in conditionals (https://github.com/hashicorp/terraform/issues/12453).
# Because of that we are turning it into a string.
# The result of this is the reason for the non straight forward outputs below.

output "bucket_name" {
  description = "Name of the bucket"
  value       = "${local.enable_cors ? join(",", aws_s3_bucket.cors_bucket.*.bucket) : join(",", aws_s3_bucket.bucket.*.bucket)}"
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = "${local.enable_cors ? join(",", aws_s3_bucket.cors_bucket.*.arn) : join(",", aws_s3_bucket.bucket.*.arn)}"
}

output "bucket_domain_name" {
  description = "The domain name of the bucket"
  value       = "${local.enable_cors ? join(",", aws_s3_bucket.cors_bucket.*.bucket_domain_name) : join(",", aws_s3_bucket.bucket.*.bucket_domain_name)}"
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the bucket"
  value       = "${local.enable_cors ? join(",", aws_s3_bucket.cors_bucket.*.bucket_regional_domain_name) : join(",", aws_s3_bucket.bucket.*.bucket_regional_domain_name)}"
}

output "bucket_website_endpoint" {
  description = "The website endpoint when static hosting is enabled. Will be an empty string if static hosting is not enabled"
  value       = "${local.enable_cors ? join(",", aws_s3_bucket.cors_bucket.*.website_endpoint) : join(",", aws_s3_bucket.bucket.*.website_endpoint)}"
}
