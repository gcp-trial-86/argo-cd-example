data "kubectl_file_documents" "my-todolist-app" {
  content = file("../manifests/argocd/my-todolist-app.yaml")
}

resource "kubectl_manifest" "my-todolist-app" {
  depends_on = [
    kubectl_manifest.argocd,
  ]
  count              = length(data.kubectl_file_documents.my-todolist-app.documents)
  yaml_body          = element(data.kubectl_file_documents.my-todolist-app.documents, count.index)
  override_namespace = "argocd"
}