module "folder_group_roles" {
  source = "../modules/folder_iam_member"

  folder_id = var.folder_id
  member    = "group:${var.group_email}"
  roles     = var.group_folder_roles
}
