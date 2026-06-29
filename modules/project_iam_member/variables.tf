variable "project_id" {
  description = "Google Cloud project ID."
  type        = string

  validation {
    condition     = length(var.project_id) > 0
    error_message = "project_id must not be empty."
  }
}

variable "member" {
  description = "IAM member to assign roles to (for example, serviceAccount:sa@project.iam.gserviceaccount.com)."
  type        = string

  validation {
    condition     = can(regex("^(group|user|serviceAccount|domain):", var.member))
    error_message = "member must start with one of 'group:', 'user:', 'serviceAccount:', or 'domain:'."
  }
}

variable "roles" {
  description = "Project-level IAM roles to assign to the member."
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
