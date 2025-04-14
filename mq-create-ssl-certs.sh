openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:4096 -out ca.key
openssl req -x509 -new -nodes -key ca.key -sha512 -days 180 -subj "/CN=example-selfsigned-ca" -out ca.crt

openssl req -new -nodes -out nhacrr-london-ext.csr -newkey rsa:4096 -keyout nhacrr-london-ext.key -subj '/CN=example-qm'
openssl x509 -req -in nhacrr-london-ext.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out nhacrr-london-ext.crt -days 180 -sha512

openssl req -new -nodes -out nhacrr-london-app.csr -newkey rsa:4096 -keyout nhacrr-london-app.key -subj '/CN=example-qm'
openssl x509 -req -in nhacrr-london-app.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out nhacrr-london-app.crt -days 180 -sha512

openssl req -new -nodes -out nhacrr-london-int.csr -newkey rsa:4096 -keyout nhacrr-london-int.key -subj '/CN=example-qm'
openssl x509 -req -in nhacrr-london-int.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out nhacrr-london-int.crt -days 180 -sha512

openssl req -new -nodes -out nhacrr-rome-ext.csr -newkey rsa:4096 -keyout nhacrr-rome-ext.key -subj '/CN=example-qm'
openssl x509 -req -in nhacrr-rome-ext.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out nhacrr-rome-ext.crt -days 180 -sha512

openssl req -new -nodes -out nhacrr-rome-app.csr -newkey rsa:4096 -keyout nhacrr-rome-app.key -subj '/CN=example-qm'
openssl x509 -req -in nhacrr-rome-app.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out nhacrr-rome-app.crt -days 180 -sha512

openssl req -new -nodes -out nhacrr-rome-int.csr -newkey rsa:4096 -keyout nhacrr-rome-int.key -subj '/CN=example-qm'
openssl x509 -req -in nhacrr-rome-int.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out nhacrr-rome-int.crt -days 180 -sha512

