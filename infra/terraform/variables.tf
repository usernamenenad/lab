variable "hcloud_token" {
  description = "Hetzner Cloud API token."
  type        = string
  sensitive   = true
}

variable "ssh_key_name" {
  description = "Hetzner SSH key name."
  type        = string
  sensitive   = true
}

variable "server_count" {
  description = "Number of servers."
  type        = number
  default     = 1
}

variable "server_name" {
  description = "Name of the server."
  type        = string
  default     = "server"
}

variable "server_image" {
  description = "Type of server image."
  type        = string
  default     = "ubuntu-24.04"
}

variable "server_type" {
  description = "Hetzner server type."
  type        = string
  default     = "cx22"
}

variable "server_location" {
  description = "Location of the server."
  type        = string
  default     = "nbg1"
}