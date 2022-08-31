#data "kubectl_file_documents" "my-nginx-app" {
#  content = file("../manifests/argocd/my-nginx-app.yaml")
#}

resource "kubectl_manifest" "my-nginx-app" {
  depends_on = [
    kubectl_manifest.argocd,
  ]
  yaml_body          = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-nginx
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://github.com/gcp-trial-86/argo-cd-example.git
    targetRevision: HEAD
    path: manifests/nginx
  destination:
    server: ${var.env}
    namespace: default
  syncPolicy:
    automated:
      selfHeal: true
YAML
  override_namespace = "argocd"
}