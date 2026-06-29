mock_provider "google" {}

variables {
  folder_id = "folders/111111111111"
  member    = "group:platform@example.com"
  roles     = ["roles/browser", "roles/logging.viewer"]
}

run "output_contains_all_roles" {
  command = plan

  assert {
    condition     = output.assignments["roles/browser"].folder == "folders/111111111111"
    error_message = "Output assignment for roles/browser has wrong folder."
  }

  assert {
    condition     = output.assignments["roles/browser"].member == "group:platform@example.com"
    error_message = "Output assignment for roles/browser has wrong member."
  }

  assert {
    condition     = output.assignments["roles/logging.viewer"].folder == "folders/111111111111"
    error_message = "Output assignment for roles/logging.viewer has wrong folder."
  }

  assert {
    condition     = output.assignments["roles/logging.viewer"].member == "group:platform@example.com"
    error_message = "Output assignment for roles/logging.viewer has wrong member."
  }
}
