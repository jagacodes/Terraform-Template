#!/bin/bash

sudo su
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
echo "<html><h1>Wow Webpage provisioned<h1></html>" > /var/www/html/index.html
