#!/bin/bash

#create pem file
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./azure.pem -out ./azure.pem

openssl pkcs12 -export -out ./azure.pfx -in ./azure.pem -name "LinuxManagmenet"

#cer file
openssl x509 -inform pem -in ./azure.pem -outform der -out ./azure.cer