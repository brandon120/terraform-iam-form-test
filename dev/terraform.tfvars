project_id = "mock-app-dev"
folder_id  = "folders/111111111111"

folder_iam_members = {
  group_roles = {
    member = "group:dev-platform@example.com"
    roles = [
      "roles/browser",
      "roles/logging.viewer",
      "roles/monitoring.viewer",
      "roles/editrole.test",
    ]
  }
}

project_iam_members = {
  service_account_roles = {
    member = "serviceAccount:workflow-dev@mock-app-dev.iam.gserviceaccount.com"
    roles = [
      "roles/viewer",
      "roles/artifactregistry.reader",
      "roles/storage.objectViewer",
    ]
  }
}
