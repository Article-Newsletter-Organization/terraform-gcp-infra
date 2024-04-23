module "kms_module" {
  source = "./modules/kms"
  providers = {
    google = google
  }

  # Variables
  region = var.region
  deletion_protection = var.deletion_protection
}

module "network_module" {
  source = "./modules/network"
  providers = {
    google = google
  }

  # Variables
  region      = var.region
  subnet_cidr = var.subnet_cidr
}

module "GKE_module" {
  source = "./modules/gke"
  providers = {
    google = google
  }

  depends_on = [module.network_module]

  # Variables
  region              = var.region
  cluster_name        = var.cluster_name
  deletion_protection = var.deletion_protection
  network             = module.network_module.network_enpoint
  subnetwork          = module.network_module.subnetwork_enpoint
}

module "db_module" {
  source = "./modules/db"
  providers = {
    google = google
  }

  depends_on = [module.GKE_module]

  # Variables
  region              = var.region
  prem_ips            = []
  network_name        = module.network_module.network_name
  deletion_protection = var.deletion_protection
}
