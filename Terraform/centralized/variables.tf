variable "location" {
  type        = string
  description = "location for the config relative to the centralized vault"
}

variable "key_alias" {
  type        = string
  description = "alias for the key used by backup process"

}

variable "kms_description" {
  type        = string
  description = "alias for the key used by backup process"
  default = "KMS key for backups"

}

variable "region" {
  description = "Choose region for stack"
  type        = string
  default     = "us-east-1"
}