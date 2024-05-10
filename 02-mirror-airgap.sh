export ARCH=amd64
export TARGET_REGISTRY=bastion.gym.lan:8443/cp4i-demo
export REGISTRY_AUTH_FILE=$XDG_RUNTIME_DIR/containers/auth.json
export OPERATOR_PACKAGE_NAME=ibm-integration-platform-navigator && export OPERATOR_VERSION=7.2.4
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION $TARGET_REGISTRY
oc image mirror   -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping.txt   -a $REGISTRY_AUTH_FILE   --filter-by-os '.*'   --skip-multiple-scopes   --max-per-registry=1
oc apply -f  ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/image-content-source-policy.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-appconnect && export OPERATOR_VERSION=11.5.0
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION $TARGET_REGISTRY
oc image mirror   -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping.txt   -a $REGISTRY_AUTH_FILE   --filter-by-os '.*'   --skip-multiple-scopes   --max-per-registry=1
oc apply -f  ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/image-content-source-policy.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-mq && export OPERATOR_VERSION=3.1.2
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION $TARGET_REGISTRY
oc image mirror   -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping.txt   -a $REGISTRY_AUTH_FILE   --filter-by-os '.*'   --skip-multiple-scopes   --max-per-registry=1
oc apply -f  ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/image-content-source-policy.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventstreams && export OPERATOR_VERSION=3.3.2
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION $TARGET_REGISTRY
oc image mirror   -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping.txt   -a $REGISTRY_AUTH_FILE   --filter-by-os '.*'   --skip-multiple-scopes   --max-per-registry=1
oc apply -f  ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/image-content-source-policy.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventendpointmanagement && export OPERATOR_VERSION=11.1.6
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION $TARGET_REGISTRY
oc image mirror   -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping.txt   -a $REGISTRY_AUTH_FILE   --filter-by-os '.*'   --skip-multiple-scopes   --max-per-registry=1
oc apply -f  ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/image-content-source-policy.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-cp-common-services && export OPERATOR_VERSION=4.6.1
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION $TARGET_REGISTRY
oc image mirror   -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping.txt   -a $REGISTRY_AUTH_FILE   --filter-by-os '.*'   --skip-multiple-scopes   --max-per-registry=1
oc apply -f  ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/image-content-source-policy.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-integration-asset-repository && export OPERATOR_VERSION=1.6.4
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION $TARGET_REGISTRY
oc image mirror   -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping.txt   -a $REGISTRY_AUTH_FILE   --filter-by-os '.*'   --skip-multiple-scopes   --max-per-registry=1
oc apply -f  ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/image-content-source-policy.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
