terraform {
  required_providers {
    incus = {
      source = "lxc/incus"
    }
  }
}

provider "incus" {
  generate_client_certificates = true
  accept_remote_certificate = true
}

resource "incus_image" "alpine" {
  source_image = {
    remote = "images"
    name = "alpine/edge"
  }
}
