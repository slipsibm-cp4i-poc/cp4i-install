# CP4I Airgapped Install Notes

See See [Online install ](README.md) for online install instructions.
## Intro
Updated For CP4I 16.1.1

These instructions assume you have a working Openshift Environment and have already setup a mirror for Openshift. Also assumes that the global pull secret and addtional trust bundle are already set in the OCP cluster so that OCP can access your local registry. [Look here for a simple mirror registry.](https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/disconnected_installation_mirroring/installing-mirroring-creating-registry#prerequisites_installing-mirroring-creating-registry) if you want to set up  your own mirror register.  

For [instructions](https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/networking/enable-cluster-wide-proxy#enable-cluster-wide-proxy) on how to trust your mirror if you want to set up your own. Sample `user-ca-bundle.yaml` provided [here](user-ca-bundle.yaml)  and `cluster-proxy.yaml` [here](cluster-proxy.yaml).  Don't execute these unless you know that your cluster doesn't have a proxy or user-ca-bundle already, otherwise you will mess up your cluster. Alternately, [You should be able to trust your registry by by editing the `image.config.openshift.io/cluster` custom resource (CR) and adding your mirror there.](https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/images/image-configuration#images-configuration-file_image-configuration)

## Disclaimer
These instructions, scripts and yaml are just helpers. Make sure you consult the install docs to ensure you understand the steps and that nothing has changed.

Install instructions for 16.1.1 are [here](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=installing#manual-installation__title__1)

## Preparation of Bastion
1. Make sure firewalls allow access to: 

    * icr.io:443 for entitled registry
    * cp.icr.io:443
    * dd0.icr.io:443
    * dd2.icr.io:443
    * quay.io:443 for Cloud Pak for Integration
    * github.com for operator packages and tools
    * redhat.com and redhat.io for Red Hat OpenShift Container Platform upgrades

1. oc login with proper credentials

1. [Download](https://github.com/IBM/ibm-pak?tab=readme-ov-file#overview) and install ibm-pak plugin

1. Go into [02-mirror-airgap-bastion.sh](02-mirror-airgap-bastion.sh), [02-mirror-airgap-portable-part1.sh](02-mirror-airgap-portable-part1.sh) or [02-mirror-airgap-portable-part2.sh](02-mirror-airgap-portable-part2.sh) and make sure arch, OPERATOR_PACKAGE_NAME and OPERATOR_VERSION are set properly. [Check here for proper Operator versions](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=miagoc-mirroring-images-portable-compute-storage-device-file-system#export-commands-for-operators__title__1)

1. Go into [10-create-namespaces.sh](10-create-namespaces.sh) and set the namespace you want to install into. It is currently set to cp4i-demo. If you are running a namespace install, set the project to the namespace you want to install into via `oc project`, otherwise set it to openshift-operators

## Populate Mirror and apply Catalog Sources and ImageContertSourcePolicies
Step 02-mirror-airgap-xxxxx.sh will mirror the images, apply imagesourcepolicies.  Where xxxx is either bastion or portable, depending on the mirroring path you chose. Edit  02-mirror-airgap-bastion.sh and set TARGET_REGISTRY to the name of your mirror registry. 

#### ** 16.1.1 Note. If mirroring of ibm-integration-platform-navigator version 8.0.2 fails, mirror 8.0.1 instead

## Bastion Path

1. Get ibm-entitlement-key 
1. `podman login cp.icr.io -u cp -p <entitlement-key>`

1. `podman login to your mirror registry`

1. Examine [02-mirror-airgap-bastion.sh](02-mirror-airgap-bastion.sh) to determine which components of cloud pak you want to mirror. Set TARGET_REGISTRY to point to your mirror

1. `./02-mirror-airgap-bastion.sh` 
    * This script iterates thru these sections of the [install.](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=cluster-mirroring-images-bastion-host#pcenv__title__1)

1. [Mirror](/README-airgap.md/#mirror-red-hat-operators-if-necessary) Red Hat Operators if necessary


## Portable Path

1. Get ibm-entitlement-key
1. `podman login cp.icr.io -u cp -p <entitlement-key>`
1. Examine [02-mirror-airgap-portable-part1.sh](02-mirror-airgap-portable-part1.sh) to determine which components of cloud pak you want to mirror. Set TARGET_REGISTRY to point to your mirror

1. `./02-mirror-airgap-portable-part1.sh`
    * This script iterates thru these sections of the [install.](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=miagoc-mirroring-images-portable-compute-storage-device-file-system)

1. [Mirror](/README-airgap.md/#mirror-red-hat-operators-if-necessary) Red Hat Operators if necessary

1. Move machine or portable file system to airgapped network and login to your mirror registry.
1. `podman login to your mirror registry`
1. Examine [02-mirror-airgap-portable-part1.sh](02-mirror-airgap-portable-part2.sh) to set components of Cloud Pak you downloaded in 02-mirror-airgap-portable-part1.sh to load into your mirror registry . Set TARGET_REGISTRY to point to your mirror
1. `./02-mirror-airgap-portable-part2.sh`

This script iterates thru these sections of the [install](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=miagoc-mirroring-images-portable-compute-storage-device-file-system)


## Mirror Red Hat Operators if Necessary
More details [here.](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=cluster-mirroring-images-bastion-host#redhat-op__title__1)

Potential Operators  needed
* RedHat Build of Keycloak, if you want to use Cloud Pak foundational services identity and access management. The catalog source must contain either the stable-v22 operator channel or the stable-v24 operator channel.
* cert-manager Operator for Red Hat OpenShift, if you are planning to deploy API Connect cluster, Event Manager, or Event Processing instances.

A sample of [imageset-config.yaml](imageset-config.yaml) is provided but make sure these are the right versions for the OpenShift version you are using.

1. Use your Red Hat credentials to login to redhat.registry.io 

    * `podman login registry.redhat.io`

1. Edit imageset-config.yaml to point to your mirror registry and adjust skiptls flags

    * `oc mirror  --config=cp4i-install/imageset-config.yaml docker://bastion.gym.lan:8443 --skip-pruning  --dest-skip-tls`

1. Go to oc-mirror-workspace/results-xxxxxx and examine the catalog source and image source policy files. Determine if the catalog source for the Operator Index is already set to your mirror repository. Examine the ImageContentSourcePolicy and make sure the name provided is unique. The default name generated is "generic-0". Then apply the catalog sourcec if necessary and then the imagecontentsourcepolicy 

1. `oc apply -f ~/oc-mirror-workspace/results-xxxxxxx/imageContentSourcePolicy.yaml`

    * verify that the catalog sources you created above are present.
`oc get catalogsource -n openshift-marketplace`

# Cloud pak Install
## Create Namespaces and Install RH Cert Manager
If you are installing to a namespace, look at 02b-cp4iopgroup.yaml and 13-foundationservices-sub.yaml and make sure the name space is set to the namespace you want to install to and then run. If you are scoping to cluster, don't run 02b-cp4iopgroup.yaml and make sure that foundation services (13-foundationservices-sub.yaml) is created in the ibm-common-services namespace.

#### **Note: You need to go in to 10-create-namespaces.sh and make sure that you set the project in the last line to either openshift-operators if you are scoping to the cluster or to the namespace that you are installing to if you are scoping to a single namespace. 

`./10-create-namespaces.sh`



`oc apply -f 02b-cp4iopgroup.yaml` * Run only if installing in Namespace Mode

`oc apply -f 11a-certmanager-opgroup.yaml`

`oc apply -f 11b-rh-certmanager-sub.yaml`

`oc get csv -n cert-manager-operator`

Validate that the following *-sub.yaml files below are set properly with the name, catalog and channel versions are set properly.

* Operator names available [here](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=operators-installing-by-using-cli#operators-available__title__1)

* Channels can be found [here](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=reference-operator-instance-versions-this-release)

Catalog names are the names used when creating the catalog sources. Those files are generated out of the mirror command above. 


## Install Foundation Services Operator
`oc apply -f  13-foundationservices-sub.yaml`

## Install CP4I Operator 
`oc apply -f  14-ibm-integration-platform-navigator-sub.yaml`
## Install ACE Operator
`oc apply -f  15-app-connect-sub.yaml`
## Install Event Endpoint Management Operator
`oc apply -f  16-eem-sub.yaml`
## Install Event Streams (Kafka) Operator
`oc apply -f  17-es-sub.yaml`
## Install License Service
`oc apply -f  18-license-sub.yaml -n ibm-licensing` 
## Install MQ Operator
`oc apply -f  19-mq-sub.yaml`
## Install IBM Automation foundation assets
`oc apply -f  20-auto-foundation-assets-sub.yaml`
## Install Event Processing Operator
`oc apply -f  21-eventprocessing-sub.yaml`
## Install API Connect Operator
`oc apply -f  22-apic-sub.yaml`


## Install Platform Navigator UI
`oc apply -f  31-platformnavigatorui.yaml`
`oc get consolelink | grep "IBM Cloud Pak for Integration"`

`oc get secret integration-admin-initial-temporary-credentials -n ibm-common-services -o jsonpath='{.data.password}' | base64 --decode`

