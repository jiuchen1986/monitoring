apiVersion: monitoring.coreos.com/v1
kind: Prometheus
metadata:
  labels:
    prometheus: k8s
  name: k8s
spec:
  externalLabels:
    cluster: {{ cluster_name }}
  nodeSelector:
    beta.kubernetes.io/os: linux
  baseImage: quay.io/prometheus/prometheus
  replicas: 1
  resources:
    limits:
      memory: 2Gi
{% if prom_item.secrets | default([]) != [] %}
  secrets:
{% for sec in prom_item.secrets %}
  - {{ sec.name }}
{% endfor %}
{% endif %}
  serviceAccountName: prometheus-k8s
  serviceMonitorNamespaceSelector: {}
  serviceMonitorSelector: {}
  priorityClassName: monitoring-critical
  version: v2.5.0
