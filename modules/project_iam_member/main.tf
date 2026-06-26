resource "google_project_iam_member" "roles" {
  for_each = var.roles

  project = var.project_id
  role    = each.value
  member  = var.member
}
