module "folder_iam" {
  source   = "../modules/folder_iam_member"
  for_each = var.folder_iam_members

  folder_id = var.folder_id
  member    = each.value.member
  roles     = each.value.roles
}
