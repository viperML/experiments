terraform {
  required_providers {
    incus = {
      source = "lxc/incus"
    }
  }
}

provider "incus" {
  generate_client_certificates = true
  accept_remote_certificate    = true
}

resource "incus_image" "ubuntu" {
  source_image = {
    remote = "images"
    name   = "ubuntu/24.04/cloud"
  }
}

resource "incus_instance" "k8s_1" {
  name  = "k8s-1"
  image = incus_image.ubuntu.fingerprint
  config = {
    "cloud-init.user-data" = file("${path.module}/user-data.yaml")
  }
}

# resource "incus_instance" "k8s_2" {
#   name = "k8s-2"
#   image = incus_image.ubuntu.fingerprint
# }

output "k8s_1_ipv4" {
  value = incus_instance.k8s_1.ipv4_address
}

# output "k8s_2_ipv4" {
#   value = incus_instance.k8s_2.ipv4_address
# }
