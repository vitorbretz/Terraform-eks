variable "cidr_block" {
  type        = string
  description = "value for the CIDR block of the VPC"


}
variable "project_name" {
  type        = string
  description = "Name of the project, used for tagging resources"

}

variable "tags" {
  type        = map(any)
  description = "value for the tags to be applied to the resources "
}