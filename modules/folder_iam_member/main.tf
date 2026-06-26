resource "google_folder_iam_member" "roles" {
  for_each = var.roles

  folder = var.folder_id
  role   = each.value
  member = var.member
}
