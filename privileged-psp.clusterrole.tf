resource "kubernetes_cluster_role" "privileged_psp" {
  metadata {
    name = "privileged-psp"
  }
  rule {
    api_groups     = ["policy"]
    resources      = ["podsecuritypolicies"]
    verbs          = ["use"]
    resource_names = ["privileged"]
  }
  rule {
    api_groups     = ["extensions"]
    resources      = ["podsecuritypolicies"]
    verbs          = ["use"]
    resource_names = ["privileged"]
  }
}
