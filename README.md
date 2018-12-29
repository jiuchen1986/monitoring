# monitoring
automation for monitoring

## Install node_exporter to nodes

    ansible-playbook -i ~/inventory/hosts node_exporter.yaml

## Generate node targets file for kaas

    ansible-playbook -i ~/inventory/hosts -e "cluster_name=<cluster_name>" -e "pod=<Pod of the cluster>"  gen_node_targets.yaml 
`pod` can be selected as "pod3\_seli", "pod5\_seli", "pod3\_sero", and "pod5\_sero".

## Generate kubelet targets file for kaas

    ansible-playbook -i ~/inventory/hosts -e "cluster_name=<cluster_name>"  gen_kubelet_targets.yaml