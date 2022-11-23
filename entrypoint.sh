#!/bin/sh

echo "DigitalOcean version"

doctl version

echo "DO Token Init"

doctl auth init -t "${INPUT_DO_ACCESS_TOKEN}"

echo "DigitalOcean add the cluster kubeconfig"

doctl kubernetes cluster kubeconfig save ${INPUT_DO_CLUSTER_CERTIFICATE}

echo "Kubectl pod list"

kubectl get pods
