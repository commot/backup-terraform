variable "location" {
    type = string
    description = "Location of vault - either local or central"
    default = ""   
}

variable "vault_policy" {
    type = string
    description = "Policy for the vault"
    default = null  
}

variable "kms_key" {
    type = string
    description = "Policy for the vault"
    default = ""   
}

variable "environment" {
    type = string
    description = "Policy for the vault"
    default = ""   
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

