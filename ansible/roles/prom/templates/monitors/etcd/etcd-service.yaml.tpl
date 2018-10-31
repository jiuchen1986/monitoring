apiVersion: v1
kind: Service
metadata:
  labels:
    component: etcd
  name: etcd
  namespace: {{ monitor_item.namespace | default(deploy_namespace) }}
spec:
  clusterIP: None
  ports:
  - name: https-metrics
    port: 2379
    targetPort: 2379
