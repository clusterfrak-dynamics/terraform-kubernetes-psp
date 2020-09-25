resource "kubernetes_role_binding" "privileged_psp_nodes" {
  metadata {
    name      = "privileged-psp-nodes"
    namespace = "kube-system"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "privileged-psp"
  }
  subject {
    kind      = "Group"
    name      = "system:nodes"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "User"
    name      = "kubelet"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "Group"
    name      = "system:serviceaccounts:kube-system"
    api_group = "rbac.authorization.k8s.io"
  }
}
