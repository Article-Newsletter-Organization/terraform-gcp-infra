terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

resource "google_kms_key_ring" "vault-unseal-keyring" {
  name     = "vault-auto-unseal"
  location = var.region
}

resource "google_kms_crypto_key" "vault-unseal-key" {
  name            = "vault-auto-unseal-crypto-key"
  key_ring        = google_kms_key_ring.vault-unseal-keyring.id
  rotation_period = "7776000s"
}
