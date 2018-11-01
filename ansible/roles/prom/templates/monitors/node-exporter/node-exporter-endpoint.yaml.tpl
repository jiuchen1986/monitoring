apiVersion: v1
kind: Endpoints
metadata:
  labels:
    k8s-app: node-exporter
  name: node-exporter
  namespace: {{ monitor_item.namespace | default(deploy_namespace) }}
subsets:
- addresses:
{% for host in groups['all'] %}
  - ip: {{ hostvars[host]['ansible_host'] }}
{% endfor %}
  ports:
  - name: http-metrics
    port: 9100
    protocol: TCP