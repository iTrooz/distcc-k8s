distcc-k8s
==

This project allows you to run a distcc server in a Kubernetes cluster, enabling distributed compilation across multiple nodes.

Note: the image should use the distribution that the build environement will use, to ensure compiler versions match.

# Setup (for an ArchLinux client)
- Add "distcc" label to nodes that should run distcc server (`kubectl label node your_node1 distcc=true`)
- create `values.local.yaml` and override any values from `values.yaml` there (e.g. `allow`)
- `helm upgrade -i --create-namespace -n distcc -i distcc-archlinux -f values.local.yaml ./`
# Usage (for an ArchLinux client)
- Add `DISTCC_HOSTS` environement variable to your build environment, with every k8s node that you labelled. (e.g. `DISTCC_HOSTS=your_node1:32632,your_node2:32632`)
- Run cmake with `-DCMAKE_C_COMPILER_LAUNCHER=distcc -DCMAKE_CXX_COMPILER_LAUNCHER=distcc`
- OR if you also want to use ccache, use `-DCMAKE_C_COMPILER_LAUNCHER="ccache" -DCMAKE_CXX_COMPILER_LAUNCHER="ccache"` and run make like this: `CCACHE_PREFIX=distcc make -j 8`

# Credits
https://github.com/cinaq/distcc-docker for inspiration
