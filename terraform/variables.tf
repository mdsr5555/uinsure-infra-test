variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "rg_name"  {
    default = "rg-dotnet-prod" 
}

variable "admin_username" {

}

variable "admin_password" {}
variable "sql_password" {}