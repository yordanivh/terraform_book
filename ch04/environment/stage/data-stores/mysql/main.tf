variable "db_password" {}

provider "aws" {
    region = "us-east-2"
}

resource "aws_db_instance" "example" {
    identifier_prefix = "terraform-up-and-running"
    engine="mysql"
    allocated_storage=10
    instance_class = "db.t2.micro"
    name ="example_database"
    username ="admin"
    password ="${var.db_password}"
}

#terraform {
 #   backend "s3" {
  #      #Replace this with your bucket name!
   #     bucket ="terraform-book-bucket"
    #    key    = "stage/data-stores/mysql/terraform.tfstate"
     #   region = "us-east-2"
#
 #       #Replace this with your DynameDB table name!
  #      dynamodb_table = "terraform-up-and-running-locks"
   #     encrypt = true
    #}
#}



