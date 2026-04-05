variable "cluster_name" {
  type = string
  default = "my-eks-cluster"
}

variable "cluster_version" {
  type = number
  default = 1.31
}

variable "region" {
  type = string
  default = "eu-west-1"
}

variable "availability_zones" {
  type = list
  default = ["eu-west-1a", "eu-west-1b"]
}



variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "kube-proxy"
      version = "v1.31.10-eksbuild.12"
    },
    {
      name    = "vpc-cni"
      version = "v1.20.4-eksbuild.2"
    },
    {
      name    = "coredns"
      version = "v1.11.3-eksbuild.1"
    },
    {
      name    = "aws-ebs-csi-driver"
      version = "v1.57.1-eksbuild.1"
    }
  ]
}