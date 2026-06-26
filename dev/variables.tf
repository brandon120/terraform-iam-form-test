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

variable "service_account_email" {
  description = "Mock service account receiving project-level IAM roles."
  type        = string
}

variable "service_account_project_roles" {
  description = "Project-level IAM roles assigned to the mock service account."
  type        = set(string)
}
