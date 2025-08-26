# Terraform-eks
🚀 Projeto Terraform com Amazon EKS

Este projeto provisiona uma infraestrutura completa no Amazon Elastic Kubernetes Service (EKS) utilizando Terraform como ferramenta de IaC (Infrastructure as Code).

O objetivo é simplificar a criação e gestão de clusters Kubernetes altamente disponíveis, seguros e escaláveis na AWS.

📋 Funcionalidades

Criação de Cluster EKS gerenciado na AWS

Configuração de VPC, subnets públicas/privadas e security groups

Criação de Node Groups (EC2) ou Fargate Profiles para execução de workloads

Integração com IAM Roles e Policies para permissões seguras

Configuração automática do kubeconfig para acesso ao cluster

Possibilidade de integrar Add-ons (CoreDNS, VPC CNI, kube-proxy, etc.)

🛠️ Pré-requisitos

Antes de começar, você precisará ter instalado:

Terraform
 >= 1.5

AWS CLI
 configurada com credenciais válidas

kubectl
 para interagir com o cluster

📂 Estrutura do Projeto
.
├── main.tf              # Definição principal do Terraform
├── variables.tf         # Variáveis de entrada
├── outputs.tf           # Saídas úteis (ex: kubeconfig)
├── vpc.tf               # Configuração de rede (VPC, subnets, etc.)
├── eks.tf               # Criação do cluster EKS
├── providers.tf         # Configuração do provider AWS
└── README.md            # Documentação do projeto

⚙️ Como usar
1. Clone este repositório
git clone https://github.com/seu-usuario/terraform-eks.git
cd terraform-eks

2. Inicialize o Terraform
terraform init

3. Valide os arquivos
terraform validate

4. Visualize o plano de execução
terraform plan

5. Aplique a infraestrutura
terraform apply -auto-approve

6. Configure o kubeconfig para acessar o cluster
aws eks update-kubeconfig --name nome-do-cluster --region us-east-1

7. Teste o acesso ao cluster
kubectl get nodes

📤 Saídas

Após a execução, o Terraform retorna informações úteis como:

Nome do cluster EKS

Endpoint do cluster

Role ARN do Node Group

Configuração de kubeconfig

🧹 Destruir recursos

Para evitar custos indesejados, destrua os recursos criados:

terraform destroy -auto-approve

🔒 Segurança

Este projeto utiliza IAM Roles dedicados para EKS e Node Groups

As chaves de acesso não devem ser commitadas

Use o AWS SSO
 ou variáveis de ambiente para autenticação

📖 Referências

Documentação do EKS

Módulo oficial Terraform EKS

Terraform AWS Provider
