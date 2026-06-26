project_id = "mock-app-test"
folder_id  = "folders/222222222222"

group_email = "test-platform@example.com"

group_folder_roles = [
  "roles/browser",
  "roles/logging.viewer",
  "roles/monitoring.viewer",
]

qa_group_email = "test-qa@example.com"

qa_group_folder_roles = [
  "roles/browser",
  "roles/resourcemanager.folderViewer",
]

auditor_user_email = "auditor.test@example.com"

auditor_user_folder_roles = [
  "roles/browser",
  "roles/logging.privateLogViewer",
]

security_group_email = "test-security@example.com"

security_group_folder_roles = [
  "roles/browser",
  "roles/resourcemanager.folderViewer",
  "roles/iam.securityReviewer",
]

service_account_email = "workflow-test@mock-app-test.iam.gserviceaccount.com"

service_account_project_roles = [
  "roles/viewer",
  "roles/artifactregistry.reader",
  "roles/storage.objectViewer",
]

ci_service_account_email = "ci-test@mock-app-test.iam.gserviceaccount.com"

ci_service_account_project_roles = [
  "roles/logging.logWriter",
  "roles/monitoring.metricWriter",
]

developer_group_email = "test-developers@example.com"

developer_group_project_roles = [
  "roles/viewer",
  "roles/cloudbuild.builds.viewer",
]

ops_group_email = "test-ops@example.com"

ops_group_project_roles = [
  "roles/viewer",
  "roles/logging.viewer",
  "roles/monitoring.viewer",
]
