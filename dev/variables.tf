variable "project_id" {
  description = "Mock Google Cloud project ID."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.project_id))
    error_message = "project_id must be a valid GCP project ID (6-30 lowercase letters, digits, or hyphens)."
  }
}

variable "folder_id" {
  description = "Mock Google Cloud folder resource name."
  type        = string

  validation {
    condition     = can(regex("^folders/[0-9]+$", var.folder_id))
    error_message = "folder_id must match the format folders/<numeric-id>."
  }
}

variable "group_email" {
  description = "Mock Google group receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.group_email))
    error_message = "group_email must be a valid email address."
  }
}

variable "group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock Google group."
  type        = set(string)
}

variable "service_account_email" {
  description = "Mock service account receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*@[a-z0-9-]+\\.iam\\.gserviceaccount\\.com$", var.service_account_email))
    error_message = "service_account_email must be a valid GCP service account email."
  }
}

variable "service_account_project_roles" {
  description = "Project-level IAM roles assigned to the mock service account."
  type        = set(string)
}
