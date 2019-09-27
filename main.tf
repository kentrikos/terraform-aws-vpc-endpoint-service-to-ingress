
data "external" "k8s_nlb" {
  program = ["${path.module}/scripts/get_ingress_hostname.sh"]

  query = {
    namespace = "kube-system"
    app       = "nginx-ingress"
  }
}

data "aws_lb" "nlb_ingress" {
  name = split("-", data.external.k8s_nlb.result["hostname"])[0]
}

# VPC Endpoint Service:
resource "aws_vpc_endpoint_service" "k8s_ingress" {
  network_load_balancer_arns = [data.aws_lb.nlb_ingress.arn]
  acceptance_required        = var.vpces_acceptance_required
  allowed_principals         = var.vpces_allowed_principals
  tags                       = var.common_tag
}

