variable "project_id" {
  description = "Mock Google Cloud project ID."
  type        = string
}

variable "folder_id" {
  description = "Mock Google Cloud folder resource name."
  type        = string
}

variable "folder_iam_members" {
  description = "Map of folder-level IAM member bindings keyed by a descriptive label."
  type = map(object({
    member = string
    roles  = set(string)
  }))
  default = {}
}

variable "project_iam_members" {
  description = "Map of project-level IAM member bindings keyed by a descriptive label."
  type = map(object({
    member = string
    roles  = set(string)
  }))
  default = {}
}
