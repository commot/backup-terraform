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


