provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "kubelancer-dev-bucket-1"
  tags = {
    env:"development"
  }
  versioning {
    enabled = true
  }
  }

resource "aws_s3_bucket_object" "readme_file" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key = "files/readme.txt"
  source = "readme.txt"
  acl = "public-read"
  etag = filemd5("readme.txt")
}