# CP4I Install Notes

oc login with proper credentials

download and install ibm-pak plugin

go into 02-mirror-airgap.sh and make sure arch is set properly



get entitlement and log in to cp.icr.io with entitlement-key user=cp , password=<entitlement-key>

`podman login cp.icr.io`

`./00-create-namespaces.sh`

`oc apply -f 01a-certmanager-opgroup.yaml`

`oc apply -f 01b-rh-certmanager-sub.yaml`

`oc get csv -n cert-manager-operator`

`./02-mirror-airgap.sh`

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
