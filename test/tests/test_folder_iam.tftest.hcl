mock_provider "google" {}

variables {
  project_id                       = "mock-app-test"
  folder_id                        = "folders/222222222222"
  group_email                      = "test-platform@example.com"
  group_folder_roles               = ["roles/browser", "roles/logging.viewer", "roles/monitoring.viewer"]
  qa_group_email                   = "test-qa@example.com"
  qa_group_folder_roles            = ["roles/browser", "roles/resourcemanager.folderViewer"]
  auditor_user_email               = "auditor.test@example.com"
  auditor_user_folder_roles        = ["roles/browser", "roles/logging.privateLogViewer"]
  security_group_email             = "test-security@example.com"
  security_group_folder_roles      = ["roles/browser", "roles/resourcemanager.folderViewer", "roles/iam.securityReviewer"]
  service_account_email            = "workflow-test@mock-app-test.iam.gserviceaccount.com"
  service_account_project_roles    = ["roles/viewer", "roles/artifactregistry.reader", "roles/storage.objectViewer"]
  ci_service_account_email         = "ci-test@mock-app-test.iam.gserviceaccount.com"
  ci_service_account_project_roles = ["roles/logging.logWriter", "roles/monitoring.metricWriter"]
  developer_group_email            = "test-developers@example.com"
  developer_group_project_roles    = ["roles/viewer", "roles/cloudbuild.builds.viewer"]
  ops_group_email                  = "test-ops@example.com"
  ops_group_project_roles          = ["roles/viewer", "roles/logging.viewer", "roles/monitoring.viewer"]
}

run "folder_group_uses_correct_member_and_folder" {
  command = plan

  assert {
    condition     = module.folder_group_roles.assignments["roles/browser"].member == "group:test-platform@example.com"
    error_message = "Folder group member should use group: prefix."
  }

  assert {
    condition     = module.folder_group_roles.assignments["roles/browser"].folder == "folders/222222222222"
    error_message = "Folder group should target the correct folder."
  }
}

run "qa_group_has_expected_roles" {
  command = plan

  assert {
    condition     = module.folder_qa_group_roles.assignments["roles/browser"].member == "group:test-qa@example.com"
    error_message = "QA group should use group: prefix."
  }

  assert {
    condition     = module.folder_qa_group_roles.assignments["roles/resourcemanager.folderViewer"].member == "group:test-qa@example.com"
    error_message = "QA group should have roles/resourcemanager.folderViewer."
  }
}

run "auditor_user_has_expected_roles" {
  command = plan

  assert {
    condition     = module.folder_auditor_user_roles.assignments["roles/browser"].member == "user:auditor.test@example.com"
    error_message = "Auditor user should use user: prefix."
  }

  assert {
    condition     = module.folder_auditor_user_roles.assignments["roles/logging.privateLogViewer"].member == "user:auditor.test@example.com"
    error_message = "Auditor user should have roles/logging.privateLogViewer."
  }
}

run "security_group_has_expected_roles" {
  command = plan

  assert {
    condition     = module.folder_security_group_roles.assignments["roles/browser"].member == "group:test-security@example.com"
    error_message = "Security group should use group: prefix."
  }

  assert {
    condition     = module.folder_security_group_roles.assignments["roles/iam.securityReviewer"].member == "group:test-security@example.com"
    error_message = "Security group should have roles/iam.securityReviewer."
  }

  assert {
    condition     = module.folder_security_group_roles.assignments["roles/resourcemanager.folderViewer"].member == "group:test-security@example.com"
    error_message = "Security group should have roles/resourcemanager.folderViewer."
  }
}
