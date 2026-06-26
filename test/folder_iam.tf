module "folder_group_roles" {
  source = "../modules/folder_iam_member"

  folder_id = var.folder_id
  member    = "group:${var.group_email}"
  roles     = var.group_folder_roles
}

module "folder_qa_group_roles" {
  source = "../modules/folder_iam_member"

  folder_id = var.folder_id
  member    = "group:${var.qa_group_email}"
  roles     = var.qa_group_folder_roles
}

module "folder_auditor_user_roles" {
  source = "../modules/folder_iam_member"

  folder_id = var.folder_id
  member    = "user:${var.auditor_user_email}"
  roles     = var.auditor_user_folder_roles
}

module "folder_security_group_roles" {
  source = "../modules/folder_iam_member"

  folder_id = var.folder_id
  member    = "group:${var.security_group_email}"
  roles     = var.security_group_folder_roles
}
