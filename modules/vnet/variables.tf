variable "vnet_name" {}
variable "location" {}
variable "rg_name" {}
variable "address_space" {}
variable "tags" {
  type = map(string)
}
