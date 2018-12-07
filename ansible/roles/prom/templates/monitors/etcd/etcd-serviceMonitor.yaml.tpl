apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    k8s-app: etcd-k8s
  name: etcd-k8s
spec:
  endpoints:
  - interval: {{ scrape_interval }}
    scrapeTimeout: {{ scrape_interval }}
    port: https-metrics
    scheme: https
    tlsConfig:
      caFile: /etc/prometheus/secrets/etcd-certs/etcd-ca.crt
      certFile: /etc/prometheus/secrets/etcd-certs/master.etcd-client.crt
      keyFile: /etc/prometheus/secrets/etcd-certs/master.etcd-client.key
  jobLabel: component
  namespaceSelector:
    matchNames:
    - {{ monitor_item.namespace | default(deploy_namespace) }}
  selector:
    matchLabels:
      component: etcd
