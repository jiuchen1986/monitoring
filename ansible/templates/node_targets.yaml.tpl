- targets:
{% for host in groups['ingress_lb'] %}
  - {{ hostvars[host]['ansible_host'] }}:9100
{% endfor %}
  labels:
    job: '{{ cluster_name }}'
    role: 'lb'
    location: '{{ pod }}'

- targets:
{% for host in groups['master'] %}
  - {{ hostvars[host]['ansible_host'] }}:9100
{% endfor %}
  labels:
    job: '{{ cluster_name }}'
    role: 'master'
    location: '{{ pod }}'

- targets:
{% for host in groups['worker'] %}
  - {{ hostvars[host]['ansible_host'] }}:9100
{% endfor %}
  labels:
    job: '{{ cluster_name }}'
    role: 'node'
    location: '{{ pod }}'
