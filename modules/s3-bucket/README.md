# S3 Bucket Module
Terraform module that creates and manages S3 Buckets in AWS.

It enforces the following:
- AES256 encryption
- Specifying specific tags
- Bucket naming convention (`<env>-<namespace>-<service>-<suffix>`)

## Usage

```
# Example with CORS
module "workforce_service_a_bucket" {
  source = "terraform-aws-name/s3-bucket"
  version = "v1.0.1"

  namespace      = "${var.namespace}"
  environment = "${var.environment}"
  service     = "service-a"
  bucket_suffix = "123456789012"

  enable_cors = "true"
  # Need to specify values for these variables if enabling CORS
  allowed_headers = ["*"]
  allowed_methods = ["GET", "PUT"]
}
```
To update the ACL
```
# Example with ACL
module "og_workforce_serviceA_bucket" {
  source = "terraform-aws-name/s3-bucket"

  acl = "public-read-write"
  ...
}
```

## Naming Convention
Buckets should follow the following naming convention
`<env>-<namespace>-<service>-<suffix>`

## License

Apache 2 Licensed. See LICENSE for full details.
