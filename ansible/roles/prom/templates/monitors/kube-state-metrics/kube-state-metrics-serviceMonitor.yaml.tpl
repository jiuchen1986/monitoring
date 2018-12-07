apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    k8s-app: kube-state-metrics
  name: kube-state-metrics
spec:
  endpoints:
  - bearerTokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token
    honorLabels: true
    interval: {{ scrape_interval }}
    port: https-main
    scheme: https
    scrapeTimeout: {{ scrape_interval }}
    tlsConfig:
      insecureSkipVerify: true
  - bearerTokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token
    interval: {{ scrape_interval }}
    scrapeTimeout: {{ scrape_interval }}
    port: https-self
    scheme: https
    tlsConfig:
      insecureSkipVerify: true
  jobLabel: k8s-app
  namespaceSelector:
    matchNames:
    - {{ monitor_item.namespace | default(deploy_namespace) }}
  selector:
    matchLabels:
      k8s-app: kube-state-metrics
