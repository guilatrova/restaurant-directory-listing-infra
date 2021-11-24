provider "aws" {
  region = "us-east-1"
}

locals {
    # ROOT account
    group_name = "restaurant-directory-listing-project"
    iam_path = "/projects/antifragiledev/restaurant-directory-listing/"
    policy_name = "access-restaurant-directory-listing-project"

    # PROJECT account
    project_aws_account = "230622729620"
    role_in_child_aws_account = "AWSRestaurantDirectoryListingRole"

}

resource "aws_iam_group" "restaurant_directory_listing_project" {
  name = local.group_name
  path = local.iam_path
}

data "aws_iam_policy_document" "restaurant_directory_listing_access_spec" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    resources = ["arn:aws:iam::${local.project_aws_account}:role/${local.role_in_child_aws_account}"]
  }
}

resource "aws_iam_group_policy" "restaurant_directory_listing_access" {
  name  = local.policy_name
  group = aws_iam_group.restaurant_directory_listing_project.name

  policy = data.aws_iam_policy_document.restaurant_directory_listing_access_spec.json
}
