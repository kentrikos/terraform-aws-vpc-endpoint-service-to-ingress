# A Terraform module to deploy proxy solution for Kubernetes ingress based on NLB and VPC Endpoint Service


# Notes

Terraform version  `>= 0.12`

## Preparations

* Deploy Kubernetes cluster with ingress service exposed via LoadBalancer with K8s-managed NLB.

## Usage

```hcl
module "vpc-endpoint-services-nlb" {
  source = "github.com/kentrikos/terraform-aws-vpc-endpoint-service-to-ingress.git"

  vpc_id      = "${var.nlb_vpc}"

  vpces_acceptance_required = "${var.vpces_acceptance_required}"
  vpces_allowed_principals  = "${var.vpces_allowed_principals}"

  common_tag = "${var.common_tag}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| `common_tag` | Tags to be assigned to each resource (that supports tagging) created by this module | map(string) | n/a |  yes |
| `vpc_id` | The identifier of the VPC for NLB and K8s instances | n/a | n/a |  yes |
| `ingress_name` | Kubernetes app name of ingreess | string | `nginx-ingress` | no |
| `ingress_namespace` | Kubernetes namespace where ingress is located | string | `kube-system` | no |
| `vpces_acceptance_required` | Whether or not VPC endpoint connection requests to the service must be accepted by the service owner | n/a | `"false"` |  no |
| `vpces_allowed_principals` | The ARNs of one or more principals allowed to discover the endpoint service | list(string) | n/a |  yes |

## Outputs

| Name | Description |
|------|-------------|
| `vpces_base_endpoint_dns_names` | The DNS names for the VPC endpoint service |
| `vpces_service_name` | Name of VPC Endpoint Service |


