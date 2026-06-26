resource "google_folder_iam_member" "group_roles" {
  for_each = var.group_folder_roles

  folder = var.folder_id
  role   = each.value
  member = "group:${var.group_email}"
}

resource "google_project_iam_member" "service_account_roles" {
  for_each = var.service_account_project_roles

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${var.service_account_email}"
}
