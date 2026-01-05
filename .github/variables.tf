# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "The AWS region to create resources in"
  type        = string
}
variable "profile" {
  description = "The AWS CLI profile to use"
  type        = string
  default = "AdministratorAccess-803103365620"
}
variable "cidr_block_private1" {
  description = "CIDR block for private subnet 1"
  type        = string
}
variable "cidr_block_private2" {
  description = "CIDR block for private subnet 2"
  type        = string
}
variable "cidr_block_private3" {
  description = "CIDR block for private subnet 3"
  type        = string
}
variable "cidr_block_public1" {
  description = "CIDR block for public subnet 1"
  type        = string
}
variable "cidr_block_public2" {
  description = "CIDR block for public subnet 2"
  type        = string
}
variable "cidr_block_public3" {
  description = "CIDR block for public subnet 3"
  type        = string
}
variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}
variable "vpc_aws_module" {
  description = "The VPC AWS Module to use"
  type        = string
}
variable "vpc_aws_module_version" {
  description = "The version of the VPC AWS Module to use"
  type        = string
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "eks_aws_module" {
  description = "The EKS AWS Module to use"
  type        = string
}
variable "eks_aws_module_version" {
  description = "The version of the EKS AWS Module to use"
  type        = string
}
variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
}
variable "single_nat_gateway" {
  description = "Use a single NAT Gateway"
  type        = bool
}
variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames in the VPC"
  type        = bool
}
variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}
variable "cluster_endpoint_public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
}
variable "enable_cluster_creator_admin_permissions" {
  description = "Enable admin permissions for the cluster creator"
  type        = bool
}
variable "AMI_TYPE" {
  description = "The AMI type for the EKS worker nodes"
  type        = string
}
variable "node_group_instance_type" {
  description = "The instance type for the EKS worker nodes"
  type        = string
}
variable "node_group_name1" {
  description = "The name of the EKS worker node group"
  type        = string
}
variable "node_min_size" {
  description = "Minimum size of the EKS worker node group"
  type        = number
}
variable "node_max_size" {
  description = "Maximum size of the EKS worker node group"
  type        = number
}
variable "node_desired_size" {
  description = "Desired size of the EKS worker node group"
  type        = number
}
variable "node_group_name2" {
  description = "The name of the second EKS worker node group"
  type        = string
}
variable "ebs_csi_policy_arn" {
  description = "The ARN of the EBS CSI Driver IAM policy"
  type        = string
}
variable "iam_assumable_role_with_oidc_module" {
  description = "The IAM Assumable Role with OIDC Module to use"
  type        = string
}
variable "iam_assumable_role_with_oidc_module_version" {
  description = "The version of the IAM Assumable Role with OIDC Module to use"
  type        = string
}



