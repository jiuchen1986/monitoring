apiVersion: v1
kind: Endpoints
metadata:
  labels:
    component: etcd
  name: etcd
  namespace: {{ monitor_item.namespace | default(deploy_namespace) }}
subsets:
- addresses:
{% for host in group['etcd'] %}
  - ip: {{ hostvars[host]['ansible_host'] }}
{% endfor %}
  ports:
  - name: https-metrics
    port: 2379
    protocol: TCP