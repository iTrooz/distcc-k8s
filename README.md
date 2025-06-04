distcc-k8s
==

This project allows you to run a distcc server in a Kubernetes cluster, enabling distributed compilation across multiple nodes.

# Usage
- Add "distcc" label to nodes that should run distcc server (`kubectl label node your_node distcc=true`)
- create `values.local.yaml` and 
- `kubectl apply -f resources.yaml`
- Add a `DISTCC_HOSTS=`