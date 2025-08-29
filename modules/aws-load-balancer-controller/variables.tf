variable "project_name" {
  type        = string
  description = "Name of the project, used for tagging resources"

}

variable "tags" {
  type        = map(any)
  description = "value for the tags to be applied to the resources "
}

variable "oidc" {
  type        = string
  description = "OIDC provider URL for the EKS cluster"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"

}