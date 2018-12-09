apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    k8s-app: kubelet
  name: kubelet
spec:
  endpoints:
  - honorLabels: true
    interval: {{ scrape_interval }}
    port: http-metrics
    scheme: http
  - honorLabels: true
    interval: {{ scrape_interval }}
    path: /metrics/cadvisor
    port: http-metrics
    scheme: http
  jobLabel: k8s-app
  namespaceSelector:
    matchNames:
    - kube-system
  selector:
    matchLabels:
      k8s-app: kubelet
