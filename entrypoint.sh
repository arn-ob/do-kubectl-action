#!/bin/sh

debug() {
  if [ "${ACTIONS_RUNNER_DEBUG:-}" = "true" ]; then
    echo "DEBUG: :: $*" >&2
  fi
}

echo "DigitalOcean version"

doctl version

echo "DO Token Init"

doctl auth init -t "${INPUT_DO_ACCESS_TOKEN}"

echo "DigitalOcean add the cluster kubeconfig"

doctl kubernetes cluster kubeconfig save ${INPUT_DO_CLUSTER_CERTIFICATE}

echo "Kubectl deployment"

kubectl set image -n ${INPUT_DO_NAMESPACE} ${INPUT_DO_DEPLOYMENT_TYPE}/${INPUT_DO_DEPLOYMENT_NAME} ${INPUT_DO_CONTAINER_NAME}=${INPUT_DO_IMAGE_TAG}