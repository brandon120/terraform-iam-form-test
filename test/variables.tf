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

variable "qa_group_email" {
  description = "Mock QA Google group receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+$", var.qa_group_email))
    error_message = "qa_group_email must be a valid email address."
  }
}

variable "qa_group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock QA Google group."
  type        = set(string)

  validation {
    condition     = length(var.qa_group_folder_roles) > 0
    error_message = "qa_group_folder_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.qa_group_folder_roles : can(regex("^roles/", r))])
    error_message = "Each role in qa_group_folder_roles must start with 'roles/'."
  }
}

variable "auditor_user_email" {
  description = "Mock user receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+$", var.auditor_user_email))
    error_message = "auditor_user_email must be a valid email address."
  }
}

variable "auditor_user_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock user."
  type        = set(string)

  validation {
    condition     = length(var.auditor_user_folder_roles) > 0
    error_message = "auditor_user_folder_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.auditor_user_folder_roles : can(regex("^roles/", r))])
    error_message = "Each role in auditor_user_folder_roles must start with 'roles/'."
  }
}

variable "security_group_email" {
  description = "Mock security Google group receiving folder-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+$", var.security_group_email))
    error_message = "security_group_email must be a valid email address."
  }
}

variable "security_group_folder_roles" {
  description = "Folder-level IAM roles assigned to the mock security Google group."
  type        = set(string)

  validation {
    condition     = length(var.security_group_folder_roles) > 0
    error_message = "security_group_folder_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.security_group_folder_roles : can(regex("^roles/", r))])
    error_message = "Each role in security_group_folder_roles must start with 'roles/'."
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

variable "ci_service_account_email" {
  description = "Mock CI service account receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.iam\\.gserviceaccount\\.com$", var.ci_service_account_email))
    error_message = "ci_service_account_email must match '<name>@<project>.iam.gserviceaccount.com'."
  }
}

variable "ci_service_account_project_roles" {
  description = "Project-level IAM roles assigned to the mock CI service account."
  type        = set(string)

  validation {
    condition     = length(var.ci_service_account_project_roles) > 0
    error_message = "ci_service_account_project_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.ci_service_account_project_roles : can(regex("^roles/", r))])
    error_message = "Each role in ci_service_account_project_roles must start with 'roles/'."
  }
}

variable "developer_group_email" {
  description = "Mock developer Google group receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+$", var.developer_group_email))
    error_message = "developer_group_email must be a valid email address."
  }
}

variable "developer_group_project_roles" {
  description = "Project-level IAM roles assigned to the mock developer Google group."
  type        = set(string)

  validation {
    condition     = length(var.developer_group_project_roles) > 0
    error_message = "developer_group_project_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.developer_group_project_roles : can(regex("^roles/", r))])
    error_message = "Each role in developer_group_project_roles must start with 'roles/'."
  }
}

variable "ops_group_email" {
  description = "Mock operations Google group receiving project-level IAM roles."
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+$", var.ops_group_email))
    error_message = "ops_group_email must be a valid email address."
  }
}

variable "ops_group_project_roles" {
  description = "Project-level IAM roles assigned to the mock operations Google group."
  type        = set(string)

  validation {
    condition     = length(var.ops_group_project_roles) > 0
    error_message = "ops_group_project_roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.ops_group_project_roles : can(regex("^roles/", r))])
    error_message = "Each role in ops_group_project_roles must start with 'roles/'."
  }
}
