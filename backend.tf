terraform {
  backend "s3" {
    bucket = "terraformstate98"
    key    = "terraform/test"
    region = "us-east-1"
  }
}