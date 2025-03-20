# CP4I Install Notes
## Intro
Updated For CP4I 16.1.1

These instructions assume you have a working Openshift Environment and have already setup a mirror for Openshift. Also assumes that the global pull secret and addtional trust bundle are already set in the OCP cluster so that OCP can access your local registry. Look here for a simple mirror registry. -> https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/disconnected_installation_mirroring/installing-mirroring-creating-registry#prerequisites_installing-mirroring-creating-registry

For an example of trusting your mirror see `user-ca-bundle.yaml` and `cluster-proxy-yaml`. https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/networking/enable-cluster-wide-proxy#enable-cluster-wide-proxy Don't execute these unless you know that your cluster doesn't have a proxy or user-ca-bundle already, otherwise you will mess up your cluster. Alternately, You should be able to trust your registry by by editing the `image.config.openshift.io/cluster` custom resource (CR) and adding your mirror there. -> https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/images/image-configuration#images-configuration-file_image-configuration

## Disclaimer
These instructions, scripts and yaml are just helpers. Make sure you consult the install docs to ensure you understand the steps and that nothing has changed.

Install instructions for 16.1.1 are here -> https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.1?topic=installing#manual-installation__title__1

## Preparation of Bastion

oc login with proper credentials

download and install ibm-pak plugin

go into 02-mirror-airgap-bastion.sh, 02-mirror-airgap-portable-part1.sh or 02-mirror-airgap-portable-part2.sh and make sure arch is set properly

go into 10-create-namespaces.sh and set the namespace you want to install into. It is currently set to cp4i-demo. If you are running a namespace install, set the project to the namespace you want to install into via `oc project`, otherwise set it to openshift-operators

get entitlement and log in to cp.icr.io with entitlement-key user=cp , password=<entitlement-key>



## Populate Mirror and apply Catalog Sources and ImageContertSourcePolicies
Step 02-mirror-airgap-xxxxx.sh will mirror the images, apply imagesourcepolicies.  Where xxxx is either bastion or portable, depending on the mirroring path you chose. Edit  02-mirror-airgap-bastion.sh and set TARGET_REGISTRY to the name of your mirror registry. 

## ** If mirroring of ibm-integration-platform-navigator version 8.0.2 fails, mirror 8.0.1 instead

## Bastion Path
get entitlement and log in to cp.icr.io with entitlement-key user=cp , password=<entitlement-key>
login to cp.icr.io and to your mirror registry 

`podman login cp.icr.io`

`podman login to your mirror registry`

examine mirroring script to determine which components of cloud pak you want to mirror

`./02-mirror-airgap-bastion.sh` 

Mirror any Red Hat Operators if necessary

## Portable Path

get entitlement and log in to cp.icr.io with entitlement-key user=cp , password=<entitlement-key>
also mirror any redhat operators needed before you move files or machine to airgapped network.
Examine mirroring scripts (part1 and part 2) to determine which components of cloud pak you want to mirror.
Run part1 on computer with Internet access.
`podman login cp.icr.io`

`./02-mirror-airgap-portable-part1.sh`

Move machine or portable file system to airgapped network and login to your mirror registry. 
`podman login to your mirror registry`

`./02-mirror-airgap-portable-part2.sh`


## Mirror Red Hat Operators if Necessary
Samples of how to do this are provided but make sure these are the right versions for the OpenShift version you are using.

Use your Red Hat credentials to login to redhat.registry.io 

`podman login registry.redhat.io`

Edit imageset-config.yaml to point to your mirror registry and adjust skiptls flags

`oc mirror  --config=cp4i-install/imageset-config.yaml docker://bastion.gym.lan:8443 --skip-pruning  --dest-skip-tls`

Go to oc-mirror-workspace/results-xxxxxx and examine the catalog source and image source policy files. Determine if the catalog source for the Operator Index is already set to your mirror repository. Examine the ImageContentSourcePolicy and make sure the name provided is unique. The default name generated is "generic-0". Then apply the catalog sourcec if necessary and then the imagecontentsourcepolicy 

`oc apply -f ~/oc-mirror-workspace/results-xxxxxxx/imageContentSourcePolicy.yaml`

verify that the catalog sources you created above are present 

`oc get catalogsource -n openshift-marketplace`

# Cloud pak Install
## Create Namespaces and Install RH Cert Manager
If you are installing to a namespace, look at 02b-cp4iopgroup.yaml and 13-foundationservices-sub.yaml and make sure the name space is set to the namespace you want to install to and then run. If you are scoping to cluster, don't run 02b-cp4iopgroup.yaml and make sure that foundation services (13-foundationservices-sub.yaml) is created in the ibm-common-services namespace.

`./10-create-namespaces.sh`


`oc apply -f 02b-cp4iopgroup.yaml` * Run only if installing in Namespace Mode

`oc apply -f 11a-certmanager-opgroup.yaml`

`oc apply -f 11b-rh-certmanager-sub.yaml`

`oc get csv -n cert-manager-operator`

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

