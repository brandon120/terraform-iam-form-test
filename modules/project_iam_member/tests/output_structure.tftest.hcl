mock_provider "google" {}

variables {
  project_id = "mock-app-dev"
  member     = "serviceAccount:ci@mock-app-dev.iam.gserviceaccount.com"
  roles      = ["roles/logging.logWriter", "roles/monitoring.metricWriter"]
}

run "output_contains_all_roles" {
  command = plan

  assert {
    condition     = output.assignments["roles/logging.logWriter"].project == "mock-app-dev"
    error_message = "Output assignment for roles/logging.logWriter has wrong project."
  }

  assert {
    condition     = output.assignments["roles/logging.logWriter"].member == "serviceAccount:ci@mock-app-dev.iam.gserviceaccount.com"
    error_message = "Output assignment for roles/logging.logWriter has wrong member."
  }

  assert {
    condition     = output.assignments["roles/monitoring.metricWriter"].project == "mock-app-dev"
    error_message = "Output assignment for roles/monitoring.metricWriter has wrong project."
  }

  assert {
    condition     = output.assignments["roles/monitoring.metricWriter"].member == "serviceAccount:ci@mock-app-dev.iam.gserviceaccount.com"
    error_message = "Output assignment for roles/monitoring.metricWriter has wrong member."
  }
}
