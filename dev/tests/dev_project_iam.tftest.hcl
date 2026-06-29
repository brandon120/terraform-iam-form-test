mock_provider "google" {}

variables {
  project_id                    = "mock-app-dev"
  folder_id                     = "folders/111111111111"
  group_email                   = "dev-platform@example.com"
  group_folder_roles            = ["roles/browser", "roles/logging.viewer", "roles/monitoring.viewer", "roles/editrole.test"]
  service_account_email         = "workflow-dev@mock-app-dev.iam.gserviceaccount.com"
  service_account_project_roles = ["roles/viewer", "roles/artifactregistry.reader", "roles/storage.objectViewer"]
}

run "project_service_account_uses_correct_member_prefix" {
  command = plan

  assert {
    condition     = module.project_service_account_roles.assignments["roles/viewer"].member == "serviceAccount:workflow-dev@mock-app-dev.iam.gserviceaccount.com"
    error_message = "Project service account member should use serviceAccount: prefix."
  }

  assert {
    condition     = module.project_service_account_roles.assignments["roles/viewer"].project == "mock-app-dev"
    error_message = "Project service account should target the correct project."
  }
}

run "project_service_account_has_all_expected_roles" {
  command = plan

  assert {
    condition     = module.project_service_account_roles.assignments["roles/artifactregistry.reader"].member == "serviceAccount:workflow-dev@mock-app-dev.iam.gserviceaccount.com"
    error_message = "Project service account should have roles/artifactregistry.reader."
  }

  assert {
    condition     = module.project_service_account_roles.assignments["roles/storage.objectViewer"].member == "serviceAccount:workflow-dev@mock-app-dev.iam.gserviceaccount.com"
    error_message = "Project service account should have roles/storage.objectViewer."
  }
}
