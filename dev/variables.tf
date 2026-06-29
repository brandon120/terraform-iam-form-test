variable "project_id" {
  description = "Mock Google Cloud project ID."
  type        = string

  validation {
    condition     = length(var.project_id) > 0
    error_message = "project_id must not be empty."
  }
}

variable "folder_id" {
  description = "Mock Google Cloud folder resource name."
  type        = string

  validation {
    condition     = can(regex("^folders/[0-9]+$", var.folder_id))
    error_message = "folder_id must match 'folders/<numeric-id>' (e.g. folders/123456789012)."
  }
}

variable "group_email" {
  description = "Mock Google group receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+$", var.group_email))
    error_message = "group_email must be a valid email address."
  }
}

variable "group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock Google group."
  type        = set(string)

  validation {
    condition     = length(var.group_folder_roles) > 0
    error_message = "group_folder_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.group_folder_roles : can(regex("^roles/", r))])
    error_message = "Each role in group_folder_roles must start with 'roles/'."
  }
}

variable "service_account_email" {
  description = "Mock service account receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.iam\\.gserviceaccount\\.com$", var.service_account_email))
    error_message = "service_account_email must match '<name>@<project>.iam.gserviceaccount.com'."
  }
}

variable "service_account_project_roles" {
  description = "Project-level IAM roles assigned to the mock service account."
  type        = set(string)

  validation {
    condition     = length(var.service_account_project_roles) > 0
    error_message = "service_account_project_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.service_account_project_roles : can(regex("^roles/", r))])
    error_message = "Each role in service_account_project_roles must start with 'roles/'."
  }
}
