#!/bin/bash
export APISERVER_CA_CERT_LOCATION=/root/ca.crt
export APISERVER_KEY_LOCATION=/root/apiserver.key
export APISERVER_CERT_LOCATION=/root/apiserver.crt

export VKUBELET_POD_IP=10.43.10.1
for i in {1..100}
do
	export VKUBELET_POD_IP=10.43.10.$i
	echo "starting $i"
	bin/virtual-kubelet --kubeconfig /root/config --provider mock --provider-config hack/skaffold/virtual-kubelet/vkubelet-mock-0-cfg.json --nodename vkubelet-mock-$i &
	sleep 0.2
done
