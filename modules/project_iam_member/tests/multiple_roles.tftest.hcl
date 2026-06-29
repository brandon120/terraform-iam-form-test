mock_provider "google" {}

variables {
  project_id = "mock-app-dev"
  member     = "serviceAccount:workflow@mock-app-dev.iam.gserviceaccount.com"
  roles      = ["roles/viewer", "roles/artifactregistry.reader", "roles/storage.objectViewer"]
}

run "creates_one_resource_per_role" {
  command = plan

  assert {
    condition     = google_project_iam_member.roles["roles/viewer"].project == "mock-app-dev"
    error_message = "Expected project to be mock-app-dev."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/viewer"].role == "roles/viewer"
    error_message = "Expected role to be roles/viewer."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/viewer"].member == "serviceAccount:workflow@mock-app-dev.iam.gserviceaccount.com"
    error_message = "Expected member to match input variable."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/artifactregistry.reader"].role == "roles/artifactregistry.reader"
    error_message = "Expected role to be roles/artifactregistry.reader."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/storage.objectViewer"].role == "roles/storage.objectViewer"
    error_message = "Expected role to be roles/storage.objectViewer."
  }
}

run "all_resources_share_same_project_and_member" {
  command = plan

  assert {
    condition     = google_project_iam_member.roles["roles/artifactregistry.reader"].project == var.project_id
    error_message = "Artifactregistry reader resource has wrong project."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/storage.objectViewer"].project == var.project_id
    error_message = "Storage objectViewer resource has wrong project."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/artifactregistry.reader"].member == var.member
    error_message = "Artifactregistry reader resource has wrong member."
  }

  assert {
    condition     = google_project_iam_member.roles["roles/storage.objectViewer"].member == var.member
    error_message = "Storage objectViewer resource has wrong member."
  }
}
