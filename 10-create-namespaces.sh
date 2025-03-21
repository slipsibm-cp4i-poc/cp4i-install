oc new-project cert-manager-operator
# you don't need to create ibm-common-services namespace unless you are installing to all namespaces
oc new-project ibm-common-services
oc new-project cp4i-demo
oc new-project ibm-licensing
# set the project to openshift-operators if you are installing to all namespaces or to the namespace you want to install to in installing to namespace only 
# oc project openshift-operators
oc project cp4i-demo