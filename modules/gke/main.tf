terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

resource "google_container_cluster" "anp_gke_cluster" {
  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection = var.deletion_protection

  node_pool {
    name = "node-pool-default"
    node_config {
      machine_type    = "e2-standard-2"
      local_ssd_count = 0
      disk_size_gb    = 50
    }
    initial_node_count = 1
  }
}

resource "null_resource" "configure_kubectl" {
  triggers = {
    cluster_endpoint = google_container_cluster.anp_gke_cluster.endpoint
  }

  provisioner "local-exec" {
    command = <<EOT
      gcloud container clusters get-credentials ${var.cluster_name} --region ${var.region}
    EOT
  }
}

# Outputs
output "anp_gke_cluster_endpoint" {
  value = google_container_cluster.anp_gke_cluster.endpoint
}

output "anp_gke_cluster_ip" {
  value = google_container_cluster.anp_gke_cluster.cluster_ipv4_cidr
}
