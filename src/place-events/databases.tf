locals {
  # ROOT account
  engine_version = "10.14"
  iam_path       = "/projects/antifragiledev/restaurant-directory-listing/"
  policy_name    = "access-restaurant-directory-listing-project"
}

module "aurora_restaurants_db" {
  source = "terraform-aws-modules/rds-aurora/aws"

  apply_immediately = true

  name                            = "${var.db_name}-db"
  engine                          = "aurora-postgresql"
  engine_mode                     = "serverless"
  engine_version                  = "10.14"
  db_parameter_group_name         = "default.aurora-postgresql10"
  db_cluster_parameter_group_name = "default.aurora-postgresql10"

  autoscaling_enabled  = true
  enable_http_endpoint = true

  database_name          = var.db_name
  master_username        = var.db_user
  master_password        = var.db_password
  create_random_password = false

  # VPC
  create_db_subnet_group = false
  create_security_group  = false
  create_monitoring_role = false

  backup_retention_period = 1
  scaling_configuration = {
    max_capacity = 2
    min_capacity = 2
  }

  tags = {
    terraformed = "true"
  }
}
