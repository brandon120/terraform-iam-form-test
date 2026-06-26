output "assignments" {
  description = "Project-level IAM assignments keyed by role."
  value = {
    for role, assignment in google_project_iam_member.roles :
    role => {
      project = assignment.project
      member  = assignment.member
    }
  }
}
