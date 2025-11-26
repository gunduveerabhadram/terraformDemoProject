variable "subscription_id" {
  type        = string
  description = "The Subscription ID for the Azure Account"

}
variable "client_id" {
  type        = string
  description = "The Client ID for the Service Principal"

}
variable "client_secret" {
  type        = string
  description = "The Client Secret for the Service Principal"

}
variable "tenant_id" {
  type        = string
  description = "The Tenant ID for the Azure Account"

}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group to be created"

}
variable "location" {
  type        = string
  description = "The Azure Region where the Resource Group will be created"

}
