variable "vpc_id" {
  description = "The identifier of the VPC for NLB and K8s instances"
}

variable "vpces_acceptance_required" {
  description = "Whether or not VPC endpoint connection requests to the service must be accepted by the service owner"
  default     = "false"
}

variable "vpces_allowed_principals" {
  type        = list(string)
  description = "The ARNs of one or more principals allowed to discover the endpoint service"
  default     = []
}

variable "common_tag" {
  type        = map(string)
  description = "Tags to be assigned to each resource (that supports tagging) created by this module"
}

variable "ingress_namespace" {
  typ         = string
  default     = "kube-system"
  description = "Kubernetes namespace where ingress is located"
}

variable "ingress_name" {
  type        = string
  default     = "nginx-ingress"
  description = "Kubernetes app name of ingreess"

}