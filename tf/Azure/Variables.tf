variable "suffix" {
  type        = string
  description = "This suffix will be used in the name of most resources"
  default     = "tfcloud"
}

variable "location" {
  type    = string
  default = "France Central"
}

variable "environment" {
  type = string
}

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "moein_obj_id" {
  type      = string
  sensitive = true
}

variable "sp_object_id" {
  type      = string
  sensitive = true
}