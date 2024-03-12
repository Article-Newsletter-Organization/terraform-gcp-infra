variable "region" {
  description = "Região do GCP onde o cluster será criado"
}

variable "prem_ips" {
  type = list(string)
  description = "On premise Ips List"
}

variable "db_tier" {
  default = "db-f1-micro"
  description = "Tipo da máquina do servidor"
}

variable "database_version" {
  default = "POSTGRES_15"
  description = "Versão do banco de dados"
}

variable "network_name" {
  default = "default"
  description = "Nome da rede VPC do banco"
}

variable "deletion_protection" {
  description = "Proteger de deleções não intensionais ou mal intensionadas"
  type = bool
  default = false
}