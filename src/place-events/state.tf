terraform {
  backend "s3" {
    bucket = "restaurant-directory-listing-tf"
    key    = "place-events"
    region = "us-east-1"
  }
}
