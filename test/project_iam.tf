module "project_service_account_roles" {
  source = "../modules/project_iam_member"

  project_id = var.project_id
  member     = "serviceAccount:${var.service_account_email}"
  roles      = var.service_account_project_roles
}
