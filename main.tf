
module "GKE_module" {
  source = "./modules/gke"
  providers = {
    google = google
  }

  # Variables
  region       = var.region
  cluster_name = var.cluster_name
}

