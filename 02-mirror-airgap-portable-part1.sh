export ARCH=amd64
export TARGET_REGISTRY=bastion.gym.lan:8443/cp4i-demo
export IMAGE_PATH=~/cp4i-portable-mirror
export REGISTRY_AUTH_FILE=$XDG_RUNTIME_DIR/containers/auth.json
export OPERATOR_PACKAGE_NAME=ibm-integration-platform-navigator && export OPERATOR_VERSION=8.0.4
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-appconnect && export OPERATOR_VERSION=12.8.2
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-mq && export OPERATOR_VERSION=3.5.1
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-cp-common-services && export OPERATOR_VERSION=4.6.11
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-apiconnect && export OPERATOR_VERSION=6.0.0
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-eventstreams && export OPERATOR_VERSION=3.6.1
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-eventendpointmanagement && export OPERATOR_VERSION=11.4.2
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-integration-asset-repository && export OPERATOR_VERSION=1.8.3
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources-linux-amd64.yaml

export OPERATOR_PACKAGE_NAME=ibm-eventprocessing && export OPERATOR_VERSION=1.3.1
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-eventautomation-flink && export OPERATOR_VERSION=1.3.1
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-datapower-operator && export OPERATOR_VERSION=1.13.1
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml

export OPERATOR_PACKAGE_NAME=ibm-licensing && export OPERATOR_VERSION=4.2.13
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml
export OPERATOR_PACKAGE_NAME=ibm-license-service-reporter-bundle && export OPERATOR_VERSION=4.2.12
oc ibm-pak get $OPERATOR_PACKAGE_NAME --version $OPERATOR_VERSION --skip-dependencies
oc ibm-pak generate mirror-manifests $OPERATOR_PACKAGE_NAME file://integration --version $OPERATOR_VERSION --final-registry $TARGET_REGISTRY
oc image mirror \
  -f ~/.ibm-pak/data/mirror/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/images-mapping-to-filesystem.txt \
  --filter-by-os '.*' \
  -a $REGISTRY_AUTH_FILE \
  --skip-multiple-scopes \
  --max-per-registry=1 \
  --dir "$IMAGE_PATH"
#  wget -O ~/catalog-source-$OPERATOR_PACKAGE_NAME-$OPERATOR_VERSION.yaml https://raw.githubusercontent.com/IBM/cloud-pak/master/repo/case/$OPERATOR_PACKAGE_NAME/$OPERATOR_VERSION/OLM/catalog-sources.yaml