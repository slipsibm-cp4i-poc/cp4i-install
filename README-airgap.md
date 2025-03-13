# CP4I Install Notes
## Intro
For CP4I 16.1.1

This assumes you have already setup a mirror for Openshift and that the global pull secret and addtional trust bundle are already set in the OCP cluster so that OCP can access your local registry. 
These instructions and yaml are just helpers. Make sure you consult the install docs to ensure you understand the steps and that nothing has changed.


oc login with proper credentials

download and install ibm-pak plugin

go into 02-mirror-airgap.sh and make sure arch is set properly

go into 10-create-namespaces.sh and set the namespace you want to install into. It is currently set to cp4i-demo. If you are running a namespace install, set the project to the namespace you want to install into via `oc project`, otherwise set it to openshift-operators

get entitlement and log in to cp.icr.io with entitlement-key user=cp , password=<entitlement-key>

`podman login cp.icr.io`

`podman login to your mirror registry`


Step 02-mirror-airgap.sh will mirror the images, apply imagesourcepolicies.  


`./02-mirror-airgap.sh` 

Use your Red Hat credentials to login to redhat.registry.io 

`podman login registry.redhat.io`

Edit imageset-config.yaml to point to your mirror registry and adjust skiptls flags

`oc mirror  --config=./imageset-config.yaml docker://bastion.gym.lan:8443 --skip-pruning --dest-skip-tls`

Go to oc-mirror-workspace/results-xxxxxx and examine the catalog source and image source policy files. Determine if the catalog source for the Operator Index is already set to your mirror repository. Examine the ImageContentSourcePolicy and make sure the name provided is unique. The default name generated is "generic-0". Then apply the catalog sourcec if necessary and then the imagecontentsourcepolicy 

`oc apply -f ~/oc-mirror-workspace/results-xxxxxxx/imageContentSourcePolicy.yaml`

verify that the catalog sources you created above are present 

`oc get catalogsource -n openshift-marketplace`

If you are installing to a namespace, look at 02b-cp4iopgroup.yaml and 13-foundationservices-sub.yaml and make sure the name space is set to the namespace you want to install to and then run. If you are scoping to cluster, don't run 02b-cp4iopgroup.yaml and make sure that foundation services (13-foundationservices-sub.yaml) is created in the ibm-common-services namespace.

`./10-create-namespaces.sh`

`oc apply -f 02b-cp4iopgroup.yaml`

`oc apply -f 11a-certmanager-opgroup.yaml`

`oc apply -f 11b-rh-certmanager-sub.yaml`

`oc get csv -n cert-manager-operator`

`oc apply -f  13-foundationservices-sub.yaml`

`oc apply -f  14-ibm-integration-platform-navigator-sub.yaml`

`oc apply -f  15-app-connect-sub.yaml`

`oc apply -f  16-eem-sub.yaml`

`oc apply -f  17-es-sub.yaml`

`oc apply -f  18-license-sub.yaml -n ibm-licensing` 

`oc apply -f  19-mq-sub.yaml`

`oc apply -f  20-auto-foundation-assets-sub.yaml`

`oc apply -f  21-eventprocessing-sub.yaml`

`oc apply -f  31-platformnavigatorui.yaml`

`oc get consolelink | grep "IBM Cloud Pak for Integration"`

`oc get secret integration-admin-initial-temporary-credentials -n ibm-common-services -o jsonpath='{.data.password}' | base64 --decode`

