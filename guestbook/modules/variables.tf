variable "environment_id" {
  description = "id of the layer0 environment to create the service"
}

variable "backend_type" {
  description = "type of backend data store for the service [memory, redis, dynamo]"
  default     = "memory"
}

variable "backend_config" {
  description = "configuration for the backend data store"
  default     = ""
}

variable "access_key" {
  description = "aws access key used for dynamo"
  default     = ""
}

variable "secret_key" {
  description = "aws secret key used for dynamo"
  default     = ""
}

variable "region" {
  description = "aws region to place resources"
  default     = "us-west-2"
}

variable "deploy_name" {
  description = "name to use for the deploy"
  default     = "guestbook"
}

variable "load_balancer_name" {
  description = "name to use for the load balancer"
  default     = "guestbook"
}

variable "service_name" {
  description = "name to use for the service"
  default     = "guestbook"
}
