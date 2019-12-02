provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../../tf_modules/modules/service/webserver-cluster"

  cluster_name           = "webserver-prod"
  db_remote_state_bucket = "terraform-book-bucket"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type        = "t2.micro"
  min_size             = 2
  max_size             = 10
  enable_autoscaling   = true
  enable_new_user_data = false

  custom_tags = {
    Owner      = "team-foo"
    DeployedBy = "terraform"
  }
}


