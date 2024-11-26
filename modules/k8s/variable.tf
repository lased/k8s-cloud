variable "zone" {
  type        = string
  description = "Zone"
}

variable "cloud_id" {
  type        = string
  description = "ID cloud"
}

variable "folder_id" {
  type        = string
  description = "ID folder"
}

variable "service_account_id" {
  type        = string
  description = "ID service account"
}

variable "node_service_account_id" {
  type        = string
  description = "ID node service account"
}

variable "network_id" {
  type        = string
  description = "ID network"
}

variable "subnet_a" {
  type = object({
    zone = string
    id   = string
  })
  description = "ID sub network"
}
