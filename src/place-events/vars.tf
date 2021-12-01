variable "aws_role" {
    default = "arn:aws:iam::230622729620:role/AWSRestaurantDirectoryListingRole"
}

variable "on_place_scrapped_queue_name" {
    default = "on-place-scrapped"
}

variable "db_name" {
  default = "restaurants"
}

variable "db_user" {
    description = "User to access database"
}

variable "db_password" {
    description = "Password to access database"
}
