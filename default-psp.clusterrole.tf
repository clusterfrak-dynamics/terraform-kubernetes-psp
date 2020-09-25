resource "kubernetes_cluster_role" "default" {
  metadata {
    name = "default-psp"
  }
  rule {
    api_groups     = ["policy"]
    resources      = ["podsecuritypolicies"]
    verbs          = ["use"]
    resource_names = ["default"]
  }
  rule {
    api_groups     = ["extensions"]
    resources      = ["podsecuritypolicies"]
    verbs          = ["use"]
    resource_names = ["default"]
  }
}
