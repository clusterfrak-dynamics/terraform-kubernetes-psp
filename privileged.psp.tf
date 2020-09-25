resource "kubernetes_pod_security_policy" "privileged" {
  metadata {
    name = "privileged"
    annotations = {
      "seccomp.security.alpha.kubernetes.io/allowedProfileNames" = "*"
    }
  }
  spec {
    privileged                 = true
    allow_privilege_escalation = true
    allowed_capabilities       = ["*"]
    volumes                    = ["*"]
    host_network               = true
    host_ports {
      min = 0
      max = 65535
    }

    host_ipc = true
    host_pid = true

    run_as_user {
      rule = "RunAsAny"
    }

    se_linux {
      rule = "RunAsAny"
    }

    supplemental_groups {
      rule = "RunAsAny"
    }

    fs_group {
      rule = "RunAsAny"
    }
  }
}
