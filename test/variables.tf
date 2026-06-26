variable "project_id" {
  description = "Mock Google Cloud project ID."
  type        = string
}

variable "folder_id" {
  description = "Mock Google Cloud folder resource name."
  type        = string
}

variable "group_email" {
  description = "Mock Google group receiving folder-level IAM roles."
  type        = string
}

variable "group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock Google group."
  type        = set(string)
}

variable "qa_group_email" {
  description = "Mock QA Google group receiving folder-level IAM roles."
  type        = string
}

variable "qa_group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock QA Google group."
  type        = set(string)
}

variable "auditor_user_email" {
  description = "Mock user receiving folder-level IAM roles."
  type        = string
}

variable "auditor_user_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock user."
  type        = set(string)
}

variable "security_group_email" {
  description = "Mock security Google group receiving folder-level IAM roles."
  type        = string
}

variable "security_group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock security Google group."
  type        = set(string)
}

variable "service_account_email" {
  description = "Mock service account receiving project-level IAM roles."
  type        = string
}

variable "service_account_project_roles" {
  description = "Project-level IAM roles assigned to the mock service account."
  type        = set(string)
}

variable "ci_service_account_email" {
  description = "Mock CI service account receiving project-level IAM roles."
  type        = string
}

variable "ci_service_account_project_roles" {
  description = "Project-level IAM roles assigned to the mock CI service account."
  type        = set(string)
}

variable "developer_group_email" {
  description = "Mock developer Google group receiving project-level IAM roles."
  type        = string
}

variable "developer_group_project_roles" {
  description = "Project-level IAM roles assigned to the mock developer Google group."
  type        = set(string)
}

variable "ops_group_email" {
  description = "Mock operations Google group receiving project-level IAM roles."
  type        = string
}

variable "ops_group_project_roles" {
  description = "Project-level IAM roles assigned to the mock operations Google group."
  type        = set(string)
}
