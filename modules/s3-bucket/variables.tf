variable "acl" {
  description = "The canned ACL to apply. Defaults to private"
  type        = "string"
  default     = "private"
}

variable "versioning" {
  description = "If object versioning is turned on for the bucket"
  default     = false
}

variable "namespace" {
  description = "The namespace for the service"
  type        = "string"
}

variable "environment" {
  description = "The environment of the bucket (i.e, development, test, staging, production)"
  type        = "string"
}

variable "service" {
  description = "The primary service that will utilize the bucket"
  type        = "string"
}

variable "allowed_headers" {
  description = "Allowed Headers for CORS"
  type        = "list"
  default     = []
}

variable "allowed_methods" {
  description = "Allowed Methods for CORS"
  type        = "list"
  default     = []
}

variable "allowed_origins" {
  description = "Allowed Origins for CORS"
  type        = "list"
  default     = []
}

variable "expose_headers" {
  description = "Exposed Headers for CORS"
  type        = "list"
  default     = []
}

variable "max_age_seconds" {
  description = "Specifies time in seconds that browser can cache the response for a preflight request. Used for CORS"
  type        = "string"
  default     = 0
}

variable "bucket_suffix" {
  description = "Suffix for bucket name"
  type        = "string"
}

variable "enable_cors" {
  description = "If CORS is enabled for the bucket"
  type        = "string"
  default     = "false"
}

variable "region" {
  description = "The region to use for the bucket"
}

variable "expiration_days" {
  description = "Number of days before objects will be delete"
  type        = "string"
  default     = 0
}

variable "website" {
  description = "Options for enabling static website hosting. Leave empty is you want disabled. Needs to contain a single map that takes the same parameters as specified in the official AWS provider for S3: https://www.terraform.io/docs/providers/aws/r/s3_bucket.html#website"
  default     = []
}

variable "tags" {
  description = "Additional default tags to add all resources"
  default     = {}
}
