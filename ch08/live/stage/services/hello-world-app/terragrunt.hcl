terraform {
  source = "../../../../modules//services/hello-world-app"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../../data-stores/mysql"]
}

inputs = {
  environment = "stage"

  min_size = 2
  max_size = 2

  enable_autoscaling = false

  db_remote_state_bucket = "terraform-book-bucket"
  db_remote_state_key    = "global/s3/terraform.tfstate"

}
