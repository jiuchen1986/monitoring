apiVersion: v1
kind: Service
metadata:
  labels:
    k8s-app: node-exporter
  name: node-exporter
  namespace: {{ monitor_item.namespace | default(deploy_namespace) }}
spec:
  clusterIP: None
  ports:
  - name: http-metrics
    port: 9100
    targetPort: 9100
