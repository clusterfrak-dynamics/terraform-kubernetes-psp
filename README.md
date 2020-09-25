# terraform-kubernetes-psp

[![Build Status](https://github.com/clusterfrak-dynamics/terraform-kubernetes-psp/workflows/Terraform/badge.svg)](https://github.com/clusterfrak-dynamics/terraform-kubernetes-psp/actions?query=workflow%3ATerraform)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/terraform-kubernetes-psp)

A terraform module to deploy a sensible set of default PSP onto a Kubernetes
cluster.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| kubernetes | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | ~> 1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable\_apparmor | Enable if hosts support apparmor. | `bool` | `false` | no |
| psp\_privileged\_ns | Namespaces allowed to use privileged psp. | `list` | `[]` | no |

## Outputs

No output.
