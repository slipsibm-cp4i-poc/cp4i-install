export ARCH=amd64
export OPERATOR_PACKAGE_NAME=ibm-integration-platform-navigator && export OPERATOR_VERSION=7.3.4
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-appconnect && export OPERATOR_VERSION=12.0.3
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-mq && export OPERATOR_VERSION=3.2.4
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventstreams && export OPERATOR_VERSION=3.5.0
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventendpointmanagement && export OPERATOR_VERSION=11.3.0
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-cp-common-services && export OPERATOR_VERSION=4.6.6
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-integration-asset-repository && export OPERATOR_VERSION=1.7.3
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml
export OPERATOR_PACKAGE_NAME=ibm-cloud-native-postgresql && export OPERATOR_VERSION=5.0.0
oc ibm-pak get ${OPERATOR_PACKAGE_NAME} --version ${OPERATOR_VERSION}
oc ibm-pak generate mirror-manifests ${OPERATOR_PACKAGE_NAME} icr.io --version ${OPERATOR_VERSION}
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources.yaml
oc apply -f ~/.ibm-pak/data/mirror/${OPERATOR_PACKAGE_NAME}/${OPERATOR_VERSION}/catalog-sources-linux-${ARCH}.yaml