remote_state {
  backend = "s3" 
  config ={
    key = "global/s3/terraform.tfstate"
    bucket = "terraform-book-bucket"
    region = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
