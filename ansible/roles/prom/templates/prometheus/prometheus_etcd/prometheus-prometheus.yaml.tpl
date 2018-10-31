apiVersion: monitoring.coreos.com/v1
kind: Prometheus
metadata:
  labels:
    prometheus: k8s
  name: k8s
spec:
  tolerations:
  - key: node-role.kubernetes.io/master
    effect: NoSchedule
  nodeSelector:
    beta.kubernetes.io/os: linux
    node-role.kubernetes.io/master: ""
  baseImage: quay.io/prometheus/prometheus
  replicas: 1
  resources:
    requests:
      memory: 400Mi
{% if prom_item.secrets | default([]) != [] %}
  secrets:
{% for sec in prom_item.secrets %}
  - {{ sec.name }}
{% endfor %}
{% endif %}
  serviceAccountName: prometheus-k8s
  serviceMonitorNamespaceSelector: {}
  serviceMonitorSelector: {}
  version: v2.4.3
