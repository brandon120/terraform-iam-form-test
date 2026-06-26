output "folder_group_assignments" {
  description = "Folder-level IAM assignments for the mock group."
  value       = module.folder_group_roles.assignments
}

output "project_service_account_assignments" {
  description = "Project-level IAM assignments for the mock service account."
  value       = module.project_service_account_roles.assignments
}
