terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "ssh-key" {
  name       = var.ssh_key_name
  public_key = file("~/.ssh/hetzner.pub")
}

resource "hcloud_server" "server" {
  count       = var.server_count
  name        = "${var.server_name}-${count.index + 1}"
  image       = var.server_image
  server_type = var.server_type
  location    = var.server_location
  ssh_keys    = [var.ssh_key_name]
}

output "ansible_inventory" {
  value = {
    all = {
      hosts = {
        for server in hcloud_server.server :
        server.name => {
          ansible_host             = server.ipv4_address
          ansible_user             = "root"
          ansible_private_key_file = "~/.ssh/hetzner.pub"
        }
      }
    }
  }
}
