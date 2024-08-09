# CP4I Install Notes

## Intro

Updated For CP4I 16.1.0

These instructions and yaml are just helpers. Make sure you consult the install docs to ensure you understand the steps and that nothing has changed.

oc login with proper credentials

download and install ibm-pak plugin

go into 02-cat-source.sh and make sure arch is set properly and that all the Operator Version Levels are all correct for the Cloud Pak version and Release you are installing.

add entitlement key to global pull secret

`./00-create-namespaces.sh`

`oc apply -f 01a-certmanager-opgroup.yaml`

`oc apply -f 01b-rh-certmanager-sub.yaml`

`oc get csv -n cert-manager-operator`

`./02-cat-source.sh`

Note that it is normal that you may see an error in the apply's.

`oc apply -f  03-foundationservices-sub.yaml`

`oc apply -f  04-ibm-integration-platform-navigator-sub.yaml`

`oc apply -f  05-app-connect-sub.yaml`

`oc apply -f  06-eem-sub.yaml`

`oc apply -f  07-es-sub.yaml`

`oc apply -f  08-license-sub.yaml -n ibm-licensing`

`oc apply -f  09-mq-sub.yaml`

`oc apply -f  10-auto-foundation-assets-sub.yaml`

`oc apply -f  11-platformnavigatorui.yaml`

`oc get consolelink | grep "IBM Cloud Pak for Integration"`

`oc get secret integration-admin-initial-temporary-credentials -n ibm-common-services -o jsonpath='{.data.password}' | base64 --decode`

If you try and delete Common Services Namespace and it doesn't terminate, try this:
<https://www.ibm.com/docs/en/cloud-paks/foundational-services/4.6?topic=online-uninstalling-foundational-services>
