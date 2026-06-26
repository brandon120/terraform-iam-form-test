output "folder_group_assignments" {
  description = "Folder-level IAM assignments for the mock group."
  value       = module.folder_group_roles.assignments
}

output "folder_qa_group_assignments" {
  description = "Folder-level IAM assignments for the mock QA group."
  value       = module.folder_qa_group_roles.assignments
}

output "folder_auditor_user_assignments" {
  description = "Folder-level IAM assignments for the mock auditor user."
  value       = module.folder_auditor_user_roles.assignments
}

output "folder_security_group_assignments" {
  description = "Folder-level IAM assignments for the mock security group."
  value       = module.folder_security_group_roles.assignments
}

output "project_service_account_assignments" {
  description = "Project-level IAM assignments for the mock service account."
  value       = module.project_service_account_roles.assignments
}

output "project_ci_service_account_assignments" {
  description = "Project-level IAM assignments for the mock CI service account."
  value       = module.project_ci_service_account_roles.assignments
}

output "project_developer_group_assignments" {
  description = "Project-level IAM assignments for the mock developer group."
  value       = module.project_developer_group_roles.assignments
}

output "project_ops_group_assignments" {
  description = "Project-level IAM assignments for the mock operations group."
  value       = module.project_ops_group_roles.assignments
}
