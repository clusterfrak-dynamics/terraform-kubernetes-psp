resource "kubernetes_pod_security_policy" "default_non_apparmor" {
  count = var.enable_apparmor ? 0 : 1
  metadata {
    name = "default"
    annotations = {
      "seccomp.security.alpha.kubernetes.io/allowedProfileNames" = "docker/default,runtime/default"
      "seccomp.security.alpha.kubernetes.io/defaultProfileName"  = "docker/default"
    }
  }

  spec {
    privileged                 = false
    allow_privilege_escalation = false
    allowed_capabilities       = []

    volumes = [
      "configMap",
      "emptyDir",
      "projected",
      "secret",
      "downwardAPI",
      "persistentVolumeClaim",
    ]

    host_network = false
    host_ipc     = false
    host_pid     = false


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

