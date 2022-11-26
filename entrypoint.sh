#!/bin/sh


debug() {
  if [ "${ACTIONS_RUNNER_DEBUG:-}" = "true" ]; then
    echo "DEBUG: :: $*" >&2
  fi
}

if [ -n "${INPUT_DO_ACCESS_TOKEN:-}" ]; then
    export DO_ACCESS_TOKEN="${INPUT_DO_ACCESS_TOKEN}"
fi

echo "DigitalOcean version"

doctl version

echo "DO Token Init"

doctl auth init -t "${INPUT_DO_ACCESS_TOKEN}"

echo "DigitalOcean add the cluster kubeconfig"

doctl kubernetes cluster kubeconfig save ${DO_CLUSTER_CERTIFICATE}

echo "Kubectl pod list"

kubectl get pods
