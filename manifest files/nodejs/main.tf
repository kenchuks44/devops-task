terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
  config_context_cluster  = "ken-cluster"
  config_path = "/home/ubuntu"
  load_config_file = false
}

resource "kubectl_manifest" "example" {
  yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nodejs-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nodejs
  template:
    metadata:
      labels:
        app: nodejs
    spec:
      containers:
        - name: nodejs-app
          image: nodejs-1.0
          ports:
            - containerPort: 3000
YAML
}
