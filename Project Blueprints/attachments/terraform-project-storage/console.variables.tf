variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "file_share_quota" {
  description = "File share quota in GB"
  type        = number
  default     = "2"
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
  default     = "mycompanypocstorageuat"
}

variable "storage_share_name" {
  description = "Storage share name"
  type        = string
  default     = "mycompanypocfileshareuat"
}
