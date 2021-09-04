resource "null_resource" "kind-cluster" {
  provisioner "local-exec" {
    command = "curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl;chmod +x ./kubectl;sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl;curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64;chmod +x ./kind;sudo install -o root -g root -m 0755 kind /usr/local/bin/kind;kind create cluster --name lab-k8s --config kind-config.yaml;kind get clusters;kubectl cluster-info --context  kind-lab-k8s;kubectl  config view --minify --flatten --context=kind-lab-k8s"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "kind delete clusters lab-k8s"
  }
}