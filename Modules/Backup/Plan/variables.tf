variable "name" {
    type = string
    description = "Name of the backup"
    default = ""  
}

variable "rules" {
    type = any
    description = "Name of the backup"
}

variable "backup_role" {
    type = string
    description = "ARN for the backup IAM role"  
    default = "" 
}

variable "selection_tags" {
    type = any
    description = "Defines how to select backups"
}

variable "location" {
    type = string
    description = "Location of vault - either local or central"
    default = ""   
}

variable "vault_policy" {
    type = string
    description = "Policy for the vault"
    default = ""   
}

variable "kms_key" {
    type = string
    description = "Policy for the vault"
    default = ""   
}

variable "plan_enabled" {
    type = bool
    description = "Policy for the vault"
    default = false

}

variable "centralized_vault" {
    type = string
    description = "Centralized vault arn"
}

variable "local_vault" {
    type = string
    description = "Local vault name"
}

variable "environment" {
    type = string
    description = "Local environment"
}

