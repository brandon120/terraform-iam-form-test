module "project_iam" {
  source   = "../modules/project_iam_member"
  for_each = var.project_iam_members

  project_id = var.project_id
  member     = each.value.member
  roles      = each.value.roles
}
