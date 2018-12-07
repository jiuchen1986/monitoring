apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    k8s-app: apiserver
  name: kube-apiserver
spec:
  endpoints:
  - bearerTokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token
    interval: {{ scrape_interval }}
    scrapeTimeout: {{ scrape_interval }}
    metricRelabelings:
    - action: drop
      regex: etcd_(debugging|disk|server).*
      sourceLabels:
      - __name__
    port: https
    scheme: https
    tlsConfig:
      caFile: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
      serverName: kubernetes
  jobLabel: component
  namespaceSelector:
    matchNames:
    - {{ monitor_item.namespace | default(deploy_namespace) }}
  selector:
    matchLabels:
      component: apiserver
      provider: kubernetes
