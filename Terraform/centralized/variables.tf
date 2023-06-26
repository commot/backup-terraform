variable "location" {
  type        = string
  description = "location for the config relative to the centralized vault"
}

variable "region" {
  description = "Choose region for stack"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Choose region for stack"
  type        = string
  default     = ""
}