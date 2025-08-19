variable "project_name" {
  type        = string
  description = "Name of the project, used for tagging resources"

}

variable "tags" {
  type        = map(any)
  description = "value for the tags to be applied to the resources "
}

variable "public_subnet_1a" {
  type        = string
  description = "subnet to create EKS cluster az 1a"
}
variable "public_subnet_1b" {
  type        = string
  description = "subnet to create EKS cluster az 1b"
}