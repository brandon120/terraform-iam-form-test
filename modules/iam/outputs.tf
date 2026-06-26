output "folder_group_assignments" {
  description = "Folder-level IAM assignments for the mock group."
  value = {
    for role, assignment in google_folder_iam_member.group_roles :
    role => {
      folder = assignment.folder
      member = assignment.member
    }
  }
}

output "project_service_account_assignments" {
  description = "Project-level IAM assignments for the mock service account."
  value = {
    for role, assignment in google_project_iam_member.service_account_roles :
    role => {
      project = assignment.project
      member  = assignment.member
    }
  }
}
