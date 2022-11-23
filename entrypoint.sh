#!/bin/sh

echo "${DO_ACCESS_TOKEN}"

echo "DigitalOcean version"

doctl version

echo "DO Token Init"

doctl auth init -t "Access Tokens"

echo "DigitalOcean add the cluster kubeconfig"

doctl kubernetes cluster kubeconfig save <Cluster-Certificate>

echo "Kubectl pod list"

kubectl get pods

