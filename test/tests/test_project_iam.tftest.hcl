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

run "project_service_account_uses_correct_prefix" {
  command = plan

  assert {
    condition     = module.project_service_account_roles.assignments["roles/viewer"].member == "serviceAccount:workflow-test@mock-app-test.iam.gserviceaccount.com"
    error_message = "Project service account should use serviceAccount: prefix."
  }

  assert {
    condition     = module.project_service_account_roles.assignments["roles/viewer"].project == "mock-app-test"
    error_message = "Project service account should target the correct project."
  }
}

run "ci_service_account_has_expected_roles" {
  command = plan

  assert {
    condition     = module.project_ci_service_account_roles.assignments["roles/logging.logWriter"].member == "serviceAccount:ci-test@mock-app-test.iam.gserviceaccount.com"
    error_message = "CI service account should have roles/logging.logWriter."
  }

  assert {
    condition     = module.project_ci_service_account_roles.assignments["roles/monitoring.metricWriter"].member == "serviceAccount:ci-test@mock-app-test.iam.gserviceaccount.com"
    error_message = "CI service account should have roles/monitoring.metricWriter."
  }
}

run "developer_group_has_expected_roles" {
  command = plan

  assert {
    condition     = module.project_developer_group_roles.assignments["roles/viewer"].member == "group:test-developers@example.com"
    error_message = "Developer group should have roles/viewer."
  }

  assert {
    condition     = module.project_developer_group_roles.assignments["roles/cloudbuild.builds.viewer"].member == "group:test-developers@example.com"
    error_message = "Developer group should have roles/cloudbuild.builds.viewer."
  }
}

run "ops_group_has_expected_roles" {
  command = plan

  assert {
    condition     = module.project_ops_group_roles.assignments["roles/viewer"].member == "group:test-ops@example.com"
    error_message = "Ops group should have roles/viewer."
  }

  assert {
    condition     = module.project_ops_group_roles.assignments["roles/logging.viewer"].member == "group:test-ops@example.com"
    error_message = "Ops group should have roles/logging.viewer."
  }

  assert {
    condition     = module.project_ops_group_roles.assignments["roles/monitoring.viewer"].member == "group:test-ops@example.com"
    error_message = "Ops group should have roles/monitoring.viewer."
  }
}
