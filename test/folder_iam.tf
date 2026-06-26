resource "google_folder_iam_member" "group_roles" {
  for_each = var.group_folder_roles

  folder = var.folder_id
  role   = each.value
  member = "group:${var.group_email}"
}
