variable "folder_id" {
  description = "Google Cloud folder resource name."
  type        = string

  validation {
    condition     = can(regex("^folders/[0-9]+$", var.folder_id))
    error_message = "folder_id must match 'folders/<numeric-id>' (e.g. folders/123456789012)."
  }
}

variable "member" {
  description = "IAM member to assign roles to (for example, group:team@example.com)."
  type        = string

  validation {
    condition     = can(regex("^(group|user|serviceAccount|domain):", var.member))
    error_message = "member must start with one of 'group:', 'user:', 'serviceAccount:', or 'domain:'."
  }
}

variable "roles" {
  description = "Folder-level IAM roles to assign to the member."
  type        = set(string)

  validation {
    condition     = length(var.roles) > 0
    error_message = "roles must not be empty; provide at least one IAM role."
  }

  validation {
    condition     = alltrue([for r in var.roles : can(regex("^roles/", r))])
    error_message = "Each role must start with 'roles/' (e.g. roles/viewer)."
  }
}
