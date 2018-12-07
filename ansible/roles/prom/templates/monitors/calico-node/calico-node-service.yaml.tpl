apiVersion: v1
kind: Service
metadata:
  labels:
    k8s-app: calico-node
  name: calico-node
spec:
  selector:
    k8s-app: calico-node
  clusterIP: None
  ports:
  - name: http-metrics
    port: 9091
    targetPort: 9091
