resource "kubernetes_cluster_role_binding" "privileged_psp" {
  count = length(var.psp_privileged_ns)

  metadata {
    name = "privileged-psp"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "privileged-psp"
  }
  subject {
    kind      = "Group"
    name      = "system:serviceaccounts:${var.psp_privileged_ns[count.index]}"
    api_group = "rbac.authorization.k8s.io"
  }
}
