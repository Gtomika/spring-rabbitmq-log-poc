variable "rabbitmq_url" {
  type = string
  default = "http://127.0.0.1:15672"
}

variable "admin_username" {
  type = string
  default = "poc"
}

variable "admin_password" {
  type = string
  default = "poc_password"
}

variable "poc_application_vhost" {
  type    = string
  default = "/poc-application"
}

variable "poc_application_username" {
  type = string
  default = "poc_application"
}

variable "poc_application_password" {
  type = string
  default = "poc_application_password"
}

variable "poc_application_log_topic_name" {
  type = string
  default = "poc-application-logs"
}