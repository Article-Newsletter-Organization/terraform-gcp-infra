# README
Este repositório tem como propósito conter o código responsável por subir toda a infraestrutura necessária para sustentar o projeto. Usamos o GCP como Cloud Provider juntamente do Terraform, tecnologia de IaC(Infrastructure as Code) para subir a infraestrutura. Nesse documento é demonstrado como deve ser configurado seu ambiente para poder utilizar este repositório.

# Pré-requisitos
- conta no GCP(Google Cloud Provider)
- terraform cli
- gcloud cli
- kubectl

# Configuração
Antes de tudo, é necessário criar um novo projeto e ativar as APIs do GCP que são utilizadas pelo terraform.

## Lista de APIs usadas:
- Compute Engine API
- Kubernetes Engine API
- Cloud Resource Manager API
- Service Networking API
- Cloud SQL Admin API

Após isso, é necessário adicionar no projeto um arquivo json contendo a chave de acesso de uma conta de serviço(IAM). É possível criar uma pelo console do GCP.

## Arquivo `terraform.tfvars`
Crie um arquivo `terraform.tfvars` na raiz do projeto, esse arquivo será responsável por conter as variáveis do projeto.

### Exemplo
Este exemplo mostra o mínimo de variáveis possível do projeto, existe mais porém opcionais.
```
project               = "article-newsletter-project"
region                = "southamerica-east1"
credentials_file      = "./gcp-credentials.private.json"
cluster_name          = "anp-k8s-cluster"
```

