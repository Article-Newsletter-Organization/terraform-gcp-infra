
variable "region" {
  description = "Região do GCP onde o cluster será criado"
  type = string
}

variable "cluster_name" {
  description = "Nome do cluster"
  type = string
}

variable "network" {
  description = "Endpoint da VPC do cluster"
  type = string
}

variable "subnetwork" {
  description = "Endpoint da subnet do VPC do cluster"
  type = string
}

variable "deletion_protection" {
  description = "Proteger de deleções não intensionais ou mal intensionadas"
  type = bool
  default = false
}