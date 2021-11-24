terraform {
  backend "s3" {
    bucket = "restaurant-directory-listing-tf"
    key    = "iam"
    region = "us-east-1"
  }
}
