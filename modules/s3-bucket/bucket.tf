locals {
  bucket_name       = "${var.environment}-${var.namespace}-${var.service}-${var.bucket_suffix}"
  enable_cors       = "${var.enable_cors == "true" ? 1 : 0}"
  no_cors           = "${local.enable_cors ? 0 : 1}"
  lifecycle_enabled = "${var.expiration_days == 0 ? 0 : 1}"
  tags              = "${merge(map("name", local.bucket_name, "service", var.service, "namespace", var.namespace, "environment", var.environment, "terraform", "true"), var.tags)}"
}

resource "aws_s3_bucket" "bucket" {
  count = "${local.no_cors}"

  bucket = "${local.bucket_name}"
  acl    = "${var.acl}"
  region = "${var.region}"

  lifecycle_rule {
    id      = "all_files_expire"
    enabled = "${local.lifecycle_enabled}"

    expiration {
      days = "${var.expiration_days}"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = "${local.tags}"

  versioning {
    enabled = "${var.versioning}"
  }

  website = "${var.website}"
}

resource "aws_s3_bucket" "cors_bucket" {
  count = "${local.enable_cors}"

  bucket = "${local.bucket_name}"
  acl    = "${var.acl}"
  region = "${var.region}"

  lifecycle_rule {
    id      = "all_files_expire"
    enabled = "${local.lifecycle_enabled}"

    expiration {
      days = "${var.expiration_days}"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = "${local.tags}"

  versioning {
    enabled = "${var.versioning}"
  }

  website = "${var.website}"

  cors_rule {
    allowed_headers = "${var.allowed_headers}"
    allowed_methods = "${var.allowed_methods}"
    allowed_origins = "${var.allowed_origins}"
    expose_headers  = "${var.expose_headers}"
    max_age_seconds = "${var.max_age_seconds}"
  }
}
