output "folder_group_assignments" {
  description = "Folder-level IAM assignments for the mock group."
  value       = module.iam.folder_group_assignments
}

output "project_service_account_assignments" {
  description = "Project-level IAM assignments for the mock service account."
  value       = module.iam.project_service_account_assignments
}
