terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

resource "null_resource" "create_file" {

  provisioner "local-exec" {
    command     = "New-Item -Path 'data_backup/local-date.txt' -ItemType File"
    interpreter = ["PowerShell", "-Command"]
  }

}

data "archive_file" "test_file" {
  type        = "zip"
  source_dir  = "data_backup"
  output_path = "data_backup_${random_string.random.result}.zip"
}

resource "random_string" "random" {
  length  = 8
  special = false
  numeric = true
  lower   = false
}

output "test_file" {
  description = "Size file"
  value       = data.archive_file.test_file.output_size
}

output "random" {
  description = "Value random"
  value       = random_string.random.result
}
