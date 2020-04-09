# Route53 DNS Zone Terraform Module

Terraform module which creates a new Route53 hosted zone

## Usage
### Example

```hcl
provider "aws" {
  version = "1.51.0"
  alias   = "us-west-2"

  allowed_account_ids = ["xxxxxxxxx"]
  region              = "us-west-2"
}

module "ogintegration.us" {
    source = "terraform-aws-name/domain"

    providers {
        aws = "aws.us-west-2"
    }

    environment = "integration"
    zone = "integration.us"
    commment = "Default domain for the integration environment"
}
```

## Terraform version

Terraform version 0.11.10 or newer is required for this module to work.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| comment | A comment for the hosted zone | string | - | yes |
| environment | The name of the environment | string | - | yes |
| tags | Additional default tags to add all resources | map | `<map>` | no |
| zone | The name of the hosted zone, e.g. integration.us or ninja.foo.bar, etc | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| domain | This is the name of the hosted zone |
| name_servers | The default list of name servers (NS) for the zone (delegation set) |
| zone_id | The Hosted Zone ID |

## Tests

Tests implemented with the [TerraTest](https://github.com/gruntwork-io/terratest) framework.


## License

Apache 2 Licensed. See LICENSE for full details.
