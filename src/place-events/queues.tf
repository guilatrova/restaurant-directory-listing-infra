module "on_place_scrapped_sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 2.0"

  name = var.on_place_scrapped_queue_name
  message_retention_seconds = 86400  # 1 day

  tags = {
    terraformed = "true"
  }
}
