mock_provider "google" {}

variables {
  folder_id = "folders/123456789012"
  member    = "group:test@example.com"
  roles     = ["roles/browser", "roles/logging.viewer", "roles/monitoring.viewer"]
}

run "creates_one_resource_per_role" {
  command = plan

  assert {
    condition     = google_folder_iam_member.roles["roles/browser"].folder == "folders/123456789012"
    error_message = "Expected folder to be folders/123456789012."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/browser"].role == "roles/browser"
    error_message = "Expected role to be roles/browser."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/browser"].member == "group:test@example.com"
    error_message = "Expected member to be group:test@example.com."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/logging.viewer"].role == "roles/logging.viewer"
    error_message = "Expected role to be roles/logging.viewer."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/monitoring.viewer"].role == "roles/monitoring.viewer"
    error_message = "Expected role to be roles/monitoring.viewer."
  }
}

run "all_resources_share_same_folder_and_member" {
  command = plan

  assert {
    condition     = google_folder_iam_member.roles["roles/logging.viewer"].folder == var.folder_id
    error_message = "Logging viewer resource has wrong folder."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/monitoring.viewer"].folder == var.folder_id
    error_message = "Monitoring viewer resource has wrong folder."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/logging.viewer"].member == var.member
    error_message = "Logging viewer resource has wrong member."
  }

  assert {
    condition     = google_folder_iam_member.roles["roles/monitoring.viewer"].member == var.member
    error_message = "Monitoring viewer resource has wrong member."
  }
}
