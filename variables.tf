variable "psp_privileged_ns" {
  default     = []
  type        = list
  description = "Namespaces allowed to use privileged psp."
}

variable "enable_apparmor" {
  default     = false
  type        = bool
  description = "Enable if hosts support apparmor."
}
