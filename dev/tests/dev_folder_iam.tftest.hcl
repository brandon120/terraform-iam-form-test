mock_provider "google" {}

variables {
  project_id                    = "mock-app-dev"
  folder_id                     = "folders/111111111111"
  group_email                   = "dev-platform@example.com"
  group_folder_roles            = ["roles/browser", "roles/logging.viewer", "roles/monitoring.viewer", "roles/editrole.test"]
  service_account_email         = "workflow-dev@mock-app-dev.iam.gserviceaccount.com"
  service_account_project_roles = ["roles/viewer", "roles/artifactregistry.reader", "roles/storage.objectViewer"]
}

run "folder_group_uses_correct_member_prefix" {
  command = plan

  assert {
    condition     = module.folder_group_roles.assignments["roles/browser"].member == "group:dev-platform@example.com"
    error_message = "Folder group member should use group: prefix."
  }

  assert {
    condition     = module.folder_group_roles.assignments["roles/browser"].folder == "folders/111111111111"
    error_message = "Folder group should target the correct folder."
  }
}

run "folder_group_has_all_expected_roles" {
  command = plan

  assert {
    condition     = module.folder_group_roles.assignments["roles/logging.viewer"].member == "group:dev-platform@example.com"
    error_message = "Folder group should have roles/logging.viewer."
  }

  assert {
    condition     = module.folder_group_roles.assignments["roles/monitoring.viewer"].member == "group:dev-platform@example.com"
    error_message = "Folder group should have roles/monitoring.viewer."
  }

  assert {
    condition     = module.folder_group_roles.assignments["roles/editrole.test"].member == "group:dev-platform@example.com"
    error_message = "Folder group should have roles/editrole.test."
  }
}
