variable "project" {
  description = "ID do projeto no GCP"
}

variable "region" {
  description = "Região do GCP onde o cluster será criado"
  default = "southamerica-east1"
}

variable "credentials_file" {
  description = "Caminho para o arquivo de credenciais do GCP"
  default = "./gcp-credentials.private.json"
}

variable "cluster_name" {
  description = "Nome do cluster"
  default = "anp-k8s-cluster"
}

