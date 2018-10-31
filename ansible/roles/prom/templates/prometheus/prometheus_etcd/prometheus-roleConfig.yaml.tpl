apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: prometheus-k8s-config
rules:
- apiGroups:
  - ""
  resources:
  - configmaps
  verbs:
  - get
