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
  default     = "KMS key for backups"

}

variable "backup_role" {
  type        = string
  description = "backup role used by local backup vault"

}

variable "selection" {
  type        = map(any)
  description = "selection criteria for backups"

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