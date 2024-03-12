
module "GKE_module" {
  source = "./modules/gke"
  providers = {
    google = google
  }

  # Variables
  region       = var.region
  cluster_name = var.cluster_name
}

module "db_module" {
  source = "./modules/db"
  providers = {
    google = google
  }

  depends_on = [module.GKE_module]

  # Variables
  region   = var.region
  prem_ips = []
  network_name = "anp_network"
}
