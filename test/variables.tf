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

variable "qa_group_email" {
  description = "Mock QA Google group receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.qa_group_email))
    error_message = "qa_group_email must be a valid email address."
  }
}

variable "qa_group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock QA Google group."
  type        = set(string)
}

variable "auditor_user_email" {
  description = "Mock user receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.auditor_user_email))
    error_message = "auditor_user_email must be a valid email address."
  }
}

variable "auditor_user_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock user."
  type        = set(string)
}

variable "security_group_email" {
  description = "Mock security Google group receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.security_group_email))
    error_message = "security_group_email must be a valid email address."
  }
}

variable "security_group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock security Google group."
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

variable "ci_service_account_email" {
  description = "Mock CI service account receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*@[a-z0-9-]+\\.iam\\.gserviceaccount\\.com$", var.ci_service_account_email))
    error_message = "ci_service_account_email must be a valid GCP service account email."
  }
}

variable "ci_service_account_project_roles" {
  description = "Project-level IAM roles assigned to the mock CI service account."
  type        = set(string)
}

variable "developer_group_email" {
  description = "Mock developer Google group receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.developer_group_email))
    error_message = "developer_group_email must be a valid email address."
  }
}

variable "developer_group_project_roles" {
  description = "Project-level IAM roles assigned to the mock developer Google group."
  type        = set(string)
}

variable "ops_group_email" {
  description = "Mock operations Google group receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.ops_group_email))
    error_message = "ops_group_email must be a valid email address."
  }
}

variable "ops_group_project_roles" {
  description = "Project-level IAM roles assigned to the mock operations Google group."
  type        = set(string)
}
