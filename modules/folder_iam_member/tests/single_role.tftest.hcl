mock_provider "google" {}

variables {
  folder_id = "folders/999999999999"
  member    = "user:auditor@example.com"
  roles     = ["roles/iam.securityReviewer"]
}

run "single_role_creates_one_resource" {
  command = plan

  assert {
    condition     = google_folder_iam_member.roles["roles/iam.securityReviewer"].folder == "folders/999999999999"
    error_message = "Expected folder to match input variable."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/iam.securityReviewer"].role == "roles/iam.securityReviewer"
    error_message = "Expected role to be roles/iam.securityReviewer."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/iam.securityReviewer"].member == "user:auditor@example.com"
    error_message = "Expected member to be user:auditor@example.com."
  }
}
