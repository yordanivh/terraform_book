variable "db_remote_state_bucket" {
  description = "The name of the s3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database'remote state in s3"
  type        = string
}

/*variable "enable_new_user_data" {
  description = "If set to true, use the new User Data script"
  type        = bool
}*/

variable "server_text" {
  description = "The text the web server should return"
  default     = "Hello, World"
  type        = string
}

variable "environment" {
  description = "The name of the environment we 're deploying to"
  type  =string
}

