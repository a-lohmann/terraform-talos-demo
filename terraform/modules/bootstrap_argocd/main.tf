resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "7.8.10"
  timeout          = 600
  values           = [file("${path.module}/argocd.yaml")]
}

resource "kubernetes_manifest" "argocd_apps" {
  manifest = yamldecode(file("${path.module}/../../../deployments/argocd/argocd-apps.yaml"))
  depends_on = [ helm_release.argocd ]
}