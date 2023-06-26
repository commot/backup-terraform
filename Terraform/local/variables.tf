variable "location" {
  type        = string
  description = "location for the config relative to the centralized vault"
}

variable "kms_description" {
  type        = string
  description = "alias for the key used by backup process"
  default     = "KMS key for backups"

}

variable "backup_role" {
  type        = string
  description = "backup role used by local backup vault"

}

variable "region" {
  description = "Choose region for stack"
  type        = string
  default     = "us-east-1"
}

variable "centrailized_vault_arn" {
  description = "ARN for the centralized vault"
  type        = string
  default     = ""

}

variable "environment" {
  description = "Choose region for stack"
  type        = string
  default     = ""
}

variable "centralized_account_number" {
  description = "Choose region for stack"
  type        = string
  default     = ""
}