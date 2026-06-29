variable "folder_id" {
  description = "Google Cloud folder resource name."
  type        = string

  validation {
    condition     = can(regex("^folders/[0-9]+$", var.folder_id))
    error_message = "folder_id must match the format folders/<numeric-id>."
  }
}

variable "member" {
  description = "IAM member to assign roles to (for example, group:team@example.com)."
  type        = string

  validation {
    condition     = can(regex("^(group|user|serviceAccount|domain):", var.member))
    error_message = "member must start with group:, user:, serviceAccount:, or domain:."
  }
}

variable "roles" {
  description = "Folder-level IAM roles to assign to the member."
  type        = set(string)

  validation {
    condition     = alltrue([for r in var.roles : can(regex("^roles/", r))])
    error_message = "Each role must start with roles/."
  }

  validation {
    condition     = !contains(tolist(var.roles), "roles/owner")
    error_message = "roles/owner is overly permissive and not allowed."
  }

  validation {
    condition     = !contains(tolist(var.roles), "roles/editor")
    error_message = "roles/editor is overly permissive and not allowed."
  }
}
