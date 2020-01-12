openssl req -out sslcert.csr -newkey rsa:2048 -nodes -keyout domain.key -config san.cnf
openssl req -noout -text -in sslcert.csr | grep DNS
openssl x509 -signkey domain.key -in sslcert.csr -req -days 3650 -out domain.crt

