provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source                 = "../../../../tf_modules/modules/service/webserver-cluster"
  cluster_name           = "webserver-stage"
  db_remote_state_bucket = "terraform-book-bucket"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  ami         = "ami-0d5d9d301c853a04a"
  server_text = "New server text"

  instance_type      = "t2.micro"
  min_size           = 2
  max_size           = 2
  enable_autoscaling = false
  #enable_new_user_data = true

  custom_tags = {
    Owner      = "team-foo"
    DeployedBy = "terraform"
  }
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
