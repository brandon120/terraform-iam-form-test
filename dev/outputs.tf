output "folder_iam_assignments" {
  description = "Folder-level IAM assignments keyed by member label."
  value = {
    for key, mod in module.folder_iam :
    key => mod.assignments
  }
}

output "project_iam_assignments" {
  description = "Project-level IAM assignments keyed by member label."
  value = {
    for key, mod in module.project_iam :
    key => mod.assignments
  }
}
