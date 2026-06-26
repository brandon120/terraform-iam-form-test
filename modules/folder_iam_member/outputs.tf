output "assignments" {
  description = "Folder-level IAM assignments keyed by role."
  value = {
    for role, assignment in google_folder_iam_member.roles :
    role => {
      folder = assignment.folder
      member = assignment.member
    }
  }
}
