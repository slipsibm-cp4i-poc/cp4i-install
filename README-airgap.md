
# CP4I Airgapped Install Notes

See [Online install](README.md) for online install instructions.

## Intro

Updated For CP4I 16.1.1

These instructions assume you have a working Openshift Environment and have already setup a mirror for Openshift. You will need an ID in the OpenShift environment with cluster admin authority. Also assumes that the global pull secret and addtional trust bundle are already set in the OCP cluster so that OCP can access your local registry.

### Setting up a mirror

[Look here for a simple mirror registry.](https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/disconnected_installation_mirroring/installing-mirroring-creating-registry#prerequisites_installing-mirroring-creating-registry) if you want to set up  your own mirror register.

For [instructions](https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/networking/enable-cluster-wide-proxy#enable-cluster-wide-proxy) on how to trust your mirror once set up your own. Sample `user-ca-bundle.yaml` provided [here](user-ca-bundle.yaml)  and `cluster-proxy.yaml` [here](cluster-proxy.yaml).  Don't execute these unless you know that your cluster doesn't have a proxy or user-ca-bundle already, otherwise you will mess up your cluster.

Alternately, You should be able to trust your registry by by editing the `image.config.openshift.io/cluster` custom resource (CR) and adding your mirror there. [Instructions](https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/images/image-configuration#images-configuration-file_image-configuration) can be found here.
Sample [spec](sample-image-cluster.yaml) section of `image.config.openshift.io/cluster`

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

1. Login to your OpenShift Cluster via oc login command with proper credentials
    * `oc login --token=xxxxxxx --server=<https://api.your.openshift:port>`

1. Ensure global pull secret has been updated with mirror information.

1. Ensure you have trusted your mirror in OpenShift via one of the [above](#setting-up-a-mirror) approaches.

1. [Download](https://github.com/IBM/ibm-pak?tab=readme-ov-file#overview) and install ibm-pak plugin

1. If you can't get access to github, then execute this command to pull the cases from icr.io

    `oc ibm-pak config repo --enable "IBM Cloud-Pak OCI registry`

1. Go into [02-mirror-airgap-bastion.sh](02-mirror-airgap-bastion.sh) or ([02-mirror-airgap-portable-part1.sh](02-mirror-airgap-portable-part1.sh) and [02-mirror-airgap-portable-part2.sh](02-mirror-airgap-portable-part2.sh)) and make sure arch, OPERATOR_PACKAGE_NAME, OPERATOR_VERSION and TARGET_REGISRTY are set properly. [Check here for proper Operator versions](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=miagoc-mirroring-images-portable-compute-storage-device-file-system#export-commands-for-operators__title__1)

1. Go into [10-create-namespaces.sh](10-create-namespaces.sh) and set the namespace you want to install into. It is currently set to cp4i-demo. If you are running a namespace install, set the project to the namespace you want to install into via `oc project`, otherwise set it to openshift-operators

## Populate Mirror and apply Catalog Sources and ImageContertSourcePolicies

Scripts 02-mirror-airgap-xxxxx.sh will mirror the images, apply imagesourcepolicies.  Where xxxx is either bastion or portable, depending on the mirroring path you chose.

### ** 16.1.1 Note. If mirroring of ibm-integration-platform-navigator version 8.0.2 fails, mirror 8.0.1 instead

## Bastion Path

1. Get ibm-entitlement-key
1. `podman login cp.icr.io -u cp -p <entitlement-key>`

1. `podman login to your mirror registry`

1. Examine [02-mirror-airgap-bastion.sh](02-mirror-airgap-bastion.sh) to determine which components of cloud pak you want to mirror.

1. `./02-mirror-airgap-bastion.sh`
    * This script iterates thru these sections of the [install.](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=cluster-mirroring-images-bastion-host#pcenv__title__1)

1. [Mirror](/README-airgap.md/#mirror-red-hat-operators-if-necessary) Red Hat Operators if necessary

## Portable Path

1. Get ibm-entitlement-key
1. `podman login cp.icr.io -u cp -p <entitlement-key>`
1. Examine [02-mirror-airgap-portable-part1.sh](02-mirror-airgap-portable-part1.sh) to determine which components of cloud pak you want to mirror.

1. `./02-mirror-airgap-portable-part1.sh`
    * This script iterates thru these sections of the [install.](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=miagoc-mirroring-images-portable-compute-storage-device-file-system)

1. [Mirror](/README-airgap.md/#mirror-red-hat-operators-if-necessary) Red Hat Operators if necessary

1. Move machine or portable file system to airgapped network and login to your mirror registry.
1. Login to your OpenShift Cluster via oc login command with proper credentials
    * `oc login --token=xxxxxxx --server=<https://api.your.openshift:port>`
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

## Cloud pak Install
To continue Cloud Pak Install go [here](README.md#cloud-pak-install)
