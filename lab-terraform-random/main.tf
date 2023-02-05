
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

resource "random_string" "random" {
  length  = 20
  special = false
  lower   = false
}
