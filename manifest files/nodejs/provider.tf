provider "kubectl" {
  config_context_cluster  = "kencluster"
  config_path = "~/.kube/config"
  load_config_file = false
}