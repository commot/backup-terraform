variable "description" {
    type = string
    description = "Description for the KMS Key"  
}

variable "key_alias" {
    type = string
    description = "Alias for the KMS key" 
}


variable "key_policy" {
    type = string
    description = "Policy for the key"  
}
