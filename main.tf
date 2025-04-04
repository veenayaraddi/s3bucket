provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "sample_file" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "text.txt"
  source = "text.txt"
  #acl    = "public-read"
}


