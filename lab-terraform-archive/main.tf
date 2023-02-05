terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.3.0"
    }
  }
}

data "archive_file" "test_file" {
  type        = "zip"
  source_file = "data_backup/index.html"
  output_path = "data_backup.zip"
}

output "test_file" {
  description = "The file was created with this size"
  value       = data.archive_file.test_file.output_size
}

