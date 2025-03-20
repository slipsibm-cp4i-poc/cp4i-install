
export OPERATOR_PACKAGE_NAME=ibm-integration-platform-navigator && export OPERATOR_VERSION=8.0.2
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-apiconnect && export OPERATOR_VERSION=6.0.0
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-mq && export OPERATOR_VERSION=3.5.0
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventstreams && export OPERATOR_VERSION=3.6.1
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventendpointmanagement && export OPERATOR_VERSION=11.4.2
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-cp-common-services && export OPERATOR_VERSION=4.6.11
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-integration-asset-repository && export OPERATOR_VERSION=1.8.2
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventprocessing && export OPERATOR_VERSION=1.3.0
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-eventautomation-flink && export OPERATOR_VERSION=1.3.0
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-datapower-operator && export OPERATOR_VERSION=1.13.1
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-licensing && export OPERATOR_VERSION=4.2.13
oc apply --filename https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml