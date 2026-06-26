module "project_service_account_roles" {
  source = "../modules/project_iam_member"

  project_id = var.project_id
  member     = "serviceAccount:${var.service_account_email}"
  roles      = var.service_account_project_roles
}

module "project_ci_service_account_roles" {
  source = "../modules/project_iam_member"

  project_id = var.project_id
  member     = "serviceAccount:${var.ci_service_account_email}"
  roles      = var.ci_service_account_project_roles
}

module "project_developer_group_roles" {
  source = "../modules/project_iam_member"

  project_id = var.project_id
  member     = "group:${var.developer_group_email}"
  roles      = var.developer_group_project_roles
}

module "project_ops_group_roles" {
  source = "../modules/project_iam_member"

  project_id = var.project_id
  member     = "group:${var.ops_group_email}"
  roles      = var.ops_group_project_roles
}
