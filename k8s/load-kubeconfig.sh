#! /usr/bin/env bash
set -eux

incus file pull k8s-1/etc/rancher/k3s/k3s.yaml kube-config.yaml
