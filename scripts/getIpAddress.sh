#!/bin/bash

urlHost="https://management.core.windows.net"


#load sub from file 'sub=xxxxx'
source ./subscription.private
path="/services/hostedservices/jettestarmpaas/deploymentslots/production"
path2="/services/hostedservices/jettestarmpaas/deployments/8dfb0cde0c974faf99067af97b776b83"


fullUrl="$urlHost/$sub$path" 
fullUrl2="$urlHost/$sub$path2"


curl --cert azure.pem:password --header x-ms-version:2012-03-01 $fullUrl -o deployments.xml

sed -e "s/xmlns/ignore/" deployments.xml > deploymentsclean.xml


#alternate but direct way - requires deployment ID/name
curl --cert azure.pem:password --header x-ms-version:2012-03-01 $fullUrl2 -o out2.xml

xmllint --xpath '/Deployment/RoleInstanceList/RoleInstance/IpAddress' deploymentsclean.xml
