#!/bin/ash

if [[ -z "${PLUGIN_DEPLOYMENT}" ]]; then
  echo "deployment is not defined"
  exit 1
fi

if [[ -z "${PLUGIN_CONTAINER}" ]]; then
  PLUGIN_CONTAINER=$PLUGIN_DEPLOYMENT
fi

if [[ -z "${PLUGIN_REPO}" ]]; then
  echo "repo is not defined"
  exit 1
fi

if [[ -z "${PLUGIN_TAG}" ]]; then
  PLUGIN_TAG='latest'
fi

if [[ -z "${PLUGIN_NAMESPACE}" ]]; then
  PLUGIN_TAG='default'
fi


kubectl set image \
  deployment/${PLUGIN_DEPLOYMENT} \
  ${PLUGIN_CONTAINER}=${PLUGIN_REPO}:${PLUGIN_TAG} \
  --namespace ${PLUGIN_NAMESPACE}
