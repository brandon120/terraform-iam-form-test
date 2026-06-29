mock_provider "google" {}

variables {
  project_id = "mock-app-test"
  member     = "group:developers@example.com"
  roles      = ["roles/cloudbuild.builds.viewer"]
}

run "single_role_creates_one_resource" {
  command = plan

  assert {
    condition     = google_project_iam_member.roles["roles/cloudbuild.builds.viewer"].project == "mock-app-test"
    error_message = "Expected project to match input variable."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/cloudbuild.builds.viewer"].role == "roles/cloudbuild.builds.viewer"
    error_message = "Expected role to be roles/cloudbuild.builds.viewer."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/cloudbuild.builds.viewer"].member == "group:developers@example.com"
    error_message = "Expected member to be group:developers@example.com."
  }
}
