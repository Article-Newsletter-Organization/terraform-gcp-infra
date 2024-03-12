terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

resource "google_compute_network" "anp-network-classic" {
  name                    = "anp-network-classic"
  project                 = google_project.anp-classic.project_id
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "anp-network-subnet-classic" {
  depends_on = [google_compute_network.anp-network-classic]

  name          = "anp-subnet-classic"
  project       = google_project.anp-classic.project_id
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.anp-network-classic.name
}

# Outputs
output "network_name" {
  value = google_compute_network.anp-network-classic.name
}
