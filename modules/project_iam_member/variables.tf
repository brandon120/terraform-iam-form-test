variable "project_id" {
  description = "Google Cloud project ID."
  type        = string
}

variable "member" {
  description = "IAM member to assign roles to (for example, serviceAccount:sa@project.iam.gserviceaccount.com)."
  type        = string
}

variable "roles" {
  description = "Project-level IAM roles to assign to the member."
  type        = set(string)
}
