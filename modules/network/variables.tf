variable "region" {
  description = "Região do GCP onde o cluster será criado"
}

variable "subnet_cidr" {
  description = "Intervalo de Ips que serão gerados pela subnet principal da VPC"
}