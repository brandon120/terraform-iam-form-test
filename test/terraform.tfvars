project_id = "mock-app-test"
folder_id  = "folders/222222222222"

folder_iam_members = {
  group_roles = {
    member = "group:test-platform@example.com"
    roles = [
      "roles/browser",
      "roles/logging.viewer",
      "roles/monitoring.viewer",
    ]
  }
  qa_group_roles = {
    member = "group:test-qa@example.com"
    roles = [
      "roles/browser",
      "roles/resourcemanager.folderViewer",
    ]
  }
  auditor_user_roles = {
    member = "user:auditor.test@example.com"
    roles = [
      "roles/browser",
      "roles/logging.privateLogViewer",
    ]
  }
  security_group_roles = {
    member = "group:test-security@example.com"
    roles = [
      "roles/browser",
      "roles/resourcemanager.folderViewer",
      "roles/iam.securityReviewer",
    ]
  }
}

project_iam_members = {
  service_account_roles = {
    member = "serviceAccount:workflow-test@mock-app-test.iam.gserviceaccount.com"
    roles = [
      "roles/viewer",
      "roles/artifactregistry.reader",
      "roles/storage.objectViewer",
    ]
  }
  ci_service_account_roles = {
    member = "serviceAccount:ci-test@mock-app-test.iam.gserviceaccount.com"
    roles = [
      "roles/logging.logWriter",
      "roles/monitoring.metricWriter",
    ]
  }
  developer_group_roles = {
    member = "group:test-developers@example.com"
    roles = [
      "roles/viewer",
      "roles/cloudbuild.builds.viewer",
    ]
  }
  ops_group_roles = {
    member = "group:test-ops@example.com"
    roles = [
      "roles/viewer",
      "roles/logging.viewer",
      "roles/monitoring.viewer",
    ]
  }
}
