# CP4I Online Install Notes

## Intro

Updated For CP4I 16.1.1

See [Airgapped instructions](README-airgap.md) for airgapped instructions.

## Disclaimer

These instructions and yaml are just helpers. Make sure you consult the install docs to ensure you understand the steps and that nothing has changed.

Install instructions for 16.1.1 are [here](<https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=installing#manual-installation__title__1>)

## Installation

1. `oc login` with proper credentials
  
1. Go into [02-cat-source.sh](/02-cat-source.sh) and make sure arch is set properly and that all the Operator Version Levels are all correct for the Cloud Pak version and Release you are installing.

1. Add ibm-entitlement key to [global pull secret](https://docs.redhat.com/en/documentation/openshift_container_platform/4.14/html/images/managing-images#images-update-global-pull-secret_using-image-pull-secrets)

## Create Namespaces and Install RH Cert Manager

If you are installing to a namespace, look at [02b-cp4iopgroup.yaml](02b-cp4iopgroup.yaml) and [13-foundationservices-sub.yaml](13-foundationservices-sub.yaml) and make sure the name space is set to the namespace you want to install to and then run. If you are scoping to cluster, don't run 02b-cp4iopgroup.yaml and make sure that foundation services (13-foundationservices-sub.yaml) is created in the ibm-common-services namespace.

## Cloud pak Install

### Create Namespaces and Install RH Cert Manager

If you are installing to a namespace, look at 02b-cp4iopgroup.yaml and 13-foundationservices-sub.yaml and make sure the name space is set to the namespace you want to install to and then run. If you are scoping to cluster, don't run 02b-cp4iopgroup.yaml and make sure that foundation services (13-foundationservices-sub.yaml) is created in the ibm-common-services namespace.

#### **Note: You need to go in to 10-create-namespaces.sh and make sure that you set the project in the last line to either openshift-operators if you are scoping to the cluster or to the namespace that you are installing to if you are scoping to a single namespace

`./10-create-namespaces.sh`

`oc apply -f 02b-cp4iopgroup.yaml` * Run only if installing in Namespace Mode

`oc apply -f 11a-certmanager-opgroup.yaml`

`oc apply -f 11b-rh-certmanager-sub.yaml`

`oc get csv -n cert-manager-operator`

Validate that the following *-sub.yaml files below are set properly with the name, catalog and channel versions are set properly.

* Operator names available [here](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=operators-installing-by-using-cli#operators-available__title__1)

* Channels can be found [here](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=reference-operator-instance-versions-this-release)

Catalog names are the names used when creating the catalog sources. Those files are generated out of the mirror command above.

### Install Foundation Services Operator

`oc apply -f  13-foundationservices-sub.yaml`

### Install CP4I Operator

`oc apply -f  14-ibm-integration-platform-navigator-sub.yaml`

### Install ACE Operator

`oc apply -f  15-app-connect-sub.yaml`

### Install Event Endpoint Management Operator

`oc apply -f  16-eem-sub.yaml`

### Install Event Streams (Kafka) Operator

`oc apply -f  17-es-sub.yaml`

### Install License Service

`oc apply -f  18a-license-og.yaml -n ibm-licensing`

`oc apply -f 18b-license-sub.yaml -n ibm-licensing`

### Install MQ Operator

`oc apply -f  19-mq-sub.yaml`

### Install IBM Automation foundation assets

`oc apply -f  20-auto-foundation-assets-sub.yaml`

### Install Event Processing Operator

`oc apply -f  21-eventprocessing-sub.yaml`

### Install API Connect Operator

`oc apply -f  22-apic-sub.yaml`

### Install Platform Navigator UI

`oc apply -f  31-platformnavigatorui.yaml`

`oc get consolelink | grep "IBM Cloud Pak for Integration"`

`oc get secret integration-admin-initial-temporary-credentials -n ibm-common-services -o jsonpath='{.data.password}' | base64 --decode`

## MQ NativeHA - CRR Setup

### Create certs

If you want to generate self-signed certs for your QMgrs for testing you can use these commands. They will create the certs and the secrets referenced in [Example: Configuring Native HA CRR using the IBM MQ Operator](https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=chaqmumo-example-configuring-native-ha-crr-using-mq-operator) using this procedure to create the [certs.](https://www.ibm.com/docs/en/ibm-mq/9.4.x?topic=manager-creating-self-signed-pki-using-openssl)

[mq-create-ssl-certs.sh](mq-create-ssl-certs.sh)

[mq-create-ocp-secrets.sh](mq-create-ocp-secrets.sh)

## Create Q Managers in both regions

Add the configmap for MQ QMgr definitions

`qm-configmap-london.yaml`

Create "London" QMgr

`qm-nativeha-london-live.yaml`

Switch to "Rome" OCP Cluster

Add the configmap for MQ QMgr definitions

`mq-configmap-rome.yaml`

Create "London" QMgr

`qm-nativeha.rome-remote.yaml`
