variable "folder_id" {
  description = "Google Cloud folder resource name."
  type        = string
}

variable "member" {
  description = "IAM member to assign roles to (for example, group:team@example.com)."
  type        = string
}

variable "roles" {
  description = "Folder-level IAM roles to assign to the member."
  type        = set(string)
}
