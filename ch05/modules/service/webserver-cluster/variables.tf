variable "cluster_name" {
  description = "The name to use for all the clustr resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the s3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database'remote state in s3"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "server_port" {
  type        = number
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}
#Conditionals
variable "enable_autoscaling" {
  description = "If set to true, enable autos caling"
  type        = bool
}

/*variable "enable_new_user_data" {
  description = "If set to true, use the new User Data script"
  type        = bool
}*/

variable "ami" {
  description = "The AMI to run in the cluster"
  default     = "ami-0d5d9d301c853a04a"
  type        = string
}

variable "server_text" {
  description = "The text the web server should return"
  default     = "Hello, World"
  type        = string
}


