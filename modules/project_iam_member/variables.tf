variable "project_id" {
  description = "Google Cloud project ID."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.project_id))
    error_message = "project_id must be a valid GCP project ID (6-30 lowercase letters, digits, or hyphens)."
  }
}

variable "member" {
  description = "IAM member to assign roles to (for example, serviceAccount:sa@project.iam.gserviceaccount.com)."
  type        = string

  validation {
    condition     = can(regex("^(group|user|serviceAccount|domain):", var.member))
    error_message = "member must start with group:, user:, serviceAccount:, or domain:."
  }
}

variable "roles" {
  description = "Project-level IAM roles to assign to the member."
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
