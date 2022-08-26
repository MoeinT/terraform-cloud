variable "environment" {
  type        = string
  description = "The environment where the resources will be deployed"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "The environment can be either staging, dev, or prod."
  }
}

variable "sp_object_id" {
  type      = string
  sensitive = true
}

variable "moein_obj_id" {
  type      = string
  sensitive = true
}

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}