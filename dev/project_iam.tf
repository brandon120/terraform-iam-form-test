resource "google_project_iam_member" "service_account_roles" {
  for_each = var.service_account_project_roles

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${var.service_account_email}"
}
