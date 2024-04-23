variable "region" {
  description = "Região do GCP onde o cluster será criado"
  default = "southamerica-east1"
}

variable "deletion_protection" {
  description = "Proteger de deleções não intensionais ou mal intensionadas"
  default = false
}