cluster "k3s" {
  driver  = "k3s" // default
  version = "v1.0.0"

  nodes = 1 // default

  network = "network.cloud"
}

// NOTE: the Kubernetes client we are using does not respect resource order
// in files, executes in alphabetical order
k8s_config "app" {
  cluster = "cluster.k3s"
  paths = [
    "./k8s_config/app",
    "./k8s_config/dashboard",
    "./k8s_config/gloo-loop/crds.yml",
    "./k8s_config/gloo-loop/gloo.yml"
  ]

  wait_until_ready = true
}