#!/bin/bash

declare ETCD_DISCOVERY_URL='https://discovery.etcd.io/new?size='

declare -i ETCD_CLUSTER_SIZE=$(grep -A 3 etcd-count ./terraform/vars.tf | grep default | cut -d "=" -f 2 | tr -d \" | tr -d " \t\n\r")
echo "Found cluster size: ${ETCD_CLUSTER_SIZE}"

declare ETCD_DISCOVERY_TOKEN=$(curl -s -w "\n" "${ETCD_DISCOVERY_URL}${ETCD_CLUSTER_SIZE}")
echo "Received discovery token: ${ETCD_DISCOVERY_TOKEN}"

echo "Replacing discovery token"
sed -i "s|<token>|${ETCD_DISCOVERY_TOKEN}|g" ./cloud-init/etcd-clconf.yaml

echo "Transpiling Ignition configuration"
ct -platform=gce -in-file ./cloud-init/etcd-clconf.yaml -out-file ./cloud-init/etcd-clconf.json

echo "Removing discovery token"
sed -i "s|${ETCD_DISCOVERY_TOKEN}|<token>|g" ./cloud-init/etcd-clconf.yaml
