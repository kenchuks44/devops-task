#!/bin/bash

sudo docker build -t kenchuks44/my-repo:nodejs-1.0 .
echo $PASSWORD | sudo docker login -u $USERNAME --password-stdin
sudo docker push kenchuks44/my-repo:nodejs-1.0