terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

resource "google_compute_network" "anp-network-classic" {
  name                    = "anp-network-classic"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "anp-network-subnet-classic" {
  depends_on = [google_compute_network.anp-network-classic]

  name          = "anp-subnet-classic"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.anp-network-classic.name
}

# Outputs
output "network_name" {
  value = google_compute_network.anp-network-classic.name
}

output "network_enpoint" {
  value = google_compute_network.anp-network-classic.self_link
}

output "subnetwork_enpoint" {
  value = google_compute_subnetwork.anp-network-subnet-classic.self_link
}
