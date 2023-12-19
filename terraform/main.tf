resource "rabbitmq_vhost" "poc_application_vhost" {
  name = var.poc_application_vhost
}

resource "rabbitmq_user" "poc_application_user" {
  name     = var.poc_application_username
  password = var.poc_application_password
  tags     = ["application"]
}

resource "rabbitmq_permissions" "poc_application_permissions" {
  user  = rabbitmq_user.poc_application_user.name
  vhost = rabbitmq_vhost.poc_application_vhost.name

  # the app only needs write permissions to send the logs
  permissions {
    configure = ""
    write     = ".*"
    read      = ""
  }
}

resource "rabbitmq_exchange" "poc_application_log_topic" {
  name = var.poc_application_log_topic_name
  vhost = rabbitmq_vhost.poc_application_vhost.name

  settings {
    type        = "topic"
    durable     = true
    auto_delete = false
  }
}