apiVersion: v1
kind: Service
metadata:
  labels:
    prometheus: k8s
  name: prometheus-k8s
spec:
  ports:
  - name: web
    port: 9090
    targetPort: web
    nodePort: {{ prom_item.node_port }}
  selector:
    app: prometheus
    prometheus: k8s
  type: NodePort
