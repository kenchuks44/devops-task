#!/bin/bash

# Install Docker
sudo apt update
sudo apt install docker.io

# install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg-curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Install kind
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo cp ./kind /usr/local/bin/kind

# Define the name of your kind cluster
CLUSTER_NAME="kencluster"

# Define the configuration for the kind cluster
cat <<EOF | sudo kind create cluster --name "$CLUSTER_NAME" --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
    - containerPort: 30201
      hostPort: 30201
      listenAddress: "0.0.0.0"
EOF
