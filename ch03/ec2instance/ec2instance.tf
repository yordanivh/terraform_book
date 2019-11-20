provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"
}

terraform {
   backend "s3" {
       # Replace this with you bucket name!
       bucket="terraform-book-bucket"
       key = "workspaces-example/terraform.tfstate"
       region="us-east-2"
       #Replace this with your DynamoDB table name!
       dynamodb_table = "terraform-up-and-running-locks"
       encrypt = true
   }

}
