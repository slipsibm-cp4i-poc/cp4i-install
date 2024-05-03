# cp4i-install

oc login 
oc apply -f  00a-certmanager-opgroup.yaml
oc apply -f 00b-rh-certmanager-sub.yaml

oc apply -f  01-create-namespace.sh
oc apply -f  02-cat-source.sh
oc apply -f  03-foundationservices-sub.yaml
oc apply -f  04-ibm-integration-platform-navigator-sub.yaml
oc apply -f  05-app-connect-sub.yaml
oc apply -f  06-eem-sub.yaml
oc apply -f  07-es-sub.yaml
oc apply -f  08-license-sub.yaml
oc apply -f  09-mq-sub.yaml