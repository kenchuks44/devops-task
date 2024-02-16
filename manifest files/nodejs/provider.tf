provider "kubectl" {
  config_context_cluster  = "ken-cluster"
  config_path = "~/.kube/config"
  load_config_file = false
}