apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    k8s-app: node-exporter
  name: node-exporter
spec:
  endpoints:
  - interval: {{ scrape_interval }}
    scrapeTimeout: {{ scrape_interval }}
    port: http-metrics
  jobLabel: k8s-app
  namespaceSelector:
    matchNames:
    - {{ monitor_item.namespace | default(deploy_namespace) }}
  selector:
    matchLabels:
      k8s-app: node-exporter
