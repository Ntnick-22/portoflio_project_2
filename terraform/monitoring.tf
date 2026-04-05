resource "time_sleep" "wait_for_kubernetes" {

    depends_on = [
       module.eks
    ]

    create_duration = "20s"
}

resource "kubernetes_namespace" "kube-namespace" {
  depends_on = [time_sleep.wait_for_kubernetes]
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus" {
  depends_on       = [kubernetes_namespace.kube-namespace, time_sleep.wait_for_kubernetes]
  name             = "monitoring"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = kubernetes_namespace.kube-namespace.metadata[0].name
  create_namespace = true
  version          = "51.3.0"
  timeout          = 2000
}
