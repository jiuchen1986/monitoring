apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    k8s-app: node-exporter
  name: node-exporter
spec:
  endpoints:
  - interval: 30s
    port: http-metrics
  jobLabel: k8s-app
  selector:
    matchLabels:
      k8s-app: node-exporter
