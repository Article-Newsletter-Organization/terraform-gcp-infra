terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

data "google_compute_network" "anp_net" {
  name = var.network_name
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "anp-db-private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = data.google_compute_network.anp_net.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = data.google_compute_network.anp_net.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_sql_database_instance" "anp_db_instance" {
  name                = "anp-db-instance"
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.deletion_protection

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = var.db_tier

    ip_configuration {
      ipv4_enabled                                  = true
      private_network                               = data.google_compute_network.anp_net.id
      enable_private_path_for_google_cloud_services = true
    }
  }
}
