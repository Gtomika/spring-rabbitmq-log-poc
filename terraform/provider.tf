terraform {
  backend "local" {}
  required_providers {
    rabbitmq = {
      source = "cyrilgdn/rabbitmq"
      version = "1.8.0"
    }
  }
}

provider "rabbitmq" {
  endpoint = var.rabbitmq_url
  username = var.admin_username
  password = var.admin_password
}