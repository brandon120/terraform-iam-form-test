module "iam" {
  source = "../modules/iam"

  project_id                    = var.project_id
  folder_id                     = var.folder_id
  group_email                   = var.group_email
  group_folder_roles            = var.group_folder_roles
  service_account_email         = var.service_account_email
  service_account_project_roles = var.service_account_project_roles
}
