docker-ucarp
============
Implements a simple Alpine Docker container that can be used to quickly provision a VRRP address on a host.

usage
-----
Build:
```
$ docker build .
```

Run in Docker:
```
$ docker run -e UCARP_VID=$UCARP_VID -e UCARP_ADDRESS=$UCARP_ADDRESS -e UCARP_PASSWORD=$UCARP_PASSWORD -e UCARP_DEVICE=$UCARP_DEVICE --privileged=true --net=host ctracey/ucarp

```

Run in Kubernetes:
```
---
apiVersion: v1
kind: Pod
metadata:
  name: kube-ucarp-vip
  namespace: kube-system
spec:
  hostNetwork: true
  containers:
  - name: kube-ucarp-vip
    image: ctracey/ucarp
    securityContext:
      privileged: true
    env:
    - name: UCARP_VID
      value: "41"
    - name: UCARP_ADDRESS
      value: "1.1.1.1/24"
    - name: UCARP_PASSWORD
      value: "somepassword"
    - name: UCARP_DEVICE
      value: "eth0"
```
