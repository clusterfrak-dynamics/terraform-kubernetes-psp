resource "kubernetes_pod_security_policy" "default" {
  count = var.enable_apparmor ? 1 : 0

  metadata {
    name = "default"
    annotations = {
      "seccomp.security.alpha.kubernetes.io/allowedProfileNames" = "docker/default,runtime/default"
      "apparmor.security.beta.kubernetes.io/allowedProfileNames" = "runtime/default"
      "seccomp.security.alpha.kubernetes.io/defaultProfileName"  = "runtime/default"
      "apparmor.security.beta.kubernetes.io/defaultProfileName"  = "runtime/default"
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

