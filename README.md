# Terraform IAM Form Test Repository

A small mock Terraform repository for testing the Product Forge
**Terraform IAM Roles Management** workflow.

## Structure

```text
terraform-iam-form-test/
├── modules/
│   ├── folder_iam_member/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── project_iam_member/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── dev/
│   ├── providers.tf
│   ├── variables.tf
│   ├── folder_iam.tf
│   ├── project_iam.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── test/
│   ├── providers.tf
│   ├── variables.tf
│   ├── folder_iam.tf
│   ├── project_iam.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── .gitignore
└── Makefile
```

Each environment contains:

- Data-driven IAM member bindings via `for_each` over map variables
- Dummy project IDs and folder IDs
- No remote backend
- No real credentials
- No `terraform apply` automation

## Existing IAM patterns

Both folder-level and project-level bindings use additive IAM member
resources driven by a shared map variable.

### Folder-level bindings

```hcl
module "folder_iam" {
  source   = "../modules/folder_iam_member"
  for_each = var.folder_iam_members

  folder_id = var.folder_id
  member    = each.value.member
  roles     = each.value.roles
}
```

### Project-level bindings

```hcl
module "project_iam" {
  source   = "../modules/project_iam_member"
  for_each = var.project_iam_members

  project_id = var.project_id
  member     = each.value.member
  roles      = each.value.roles
}
```

### Adding a new IAM member

Add an entry to the appropriate map in `terraform.tfvars`:

```hcl
folder_iam_members = {
  group_roles = {
    member = "group:platform@example.com"
    roles  = ["roles/browser", "roles/logging.viewer"]
  }
  # Add new members here — no new module blocks or variables needed.
  new_group_roles = {
    member = "group:new-team@example.com"
    roles  = ["roles/browser"]
  }
}
```

These resources are additive IAM member resources. A workflow should preserve the
existing patterns and must not convert them to authoritative IAM bindings.

## Mock assignments

### Dev

Folder group:

- `dev-platform@example.com`
- `roles/browser`
- `roles/logging.viewer`
- `roles/monitoring.viewer`
- `roles/editrole.test`

Project service account:

- `workflow-dev@mock-app-dev.iam.gserviceaccount.com`
- `roles/viewer`
- `roles/artifactregistry.reader`
- `roles/storage.objectViewer`

### Test

Folder members:

- `test-platform@example.com` — `roles/browser`, `roles/logging.viewer`, `roles/monitoring.viewer`
- `test-qa@example.com` — `roles/browser`, `roles/resourcemanager.folderViewer`
- `auditor.test@example.com` — `roles/browser`, `roles/logging.privateLogViewer`
- `test-security@example.com` — `roles/browser`, `roles/resourcemanager.folderViewer`, `roles/iam.securityReviewer`

Project members:

- `workflow-test@mock-app-test.iam.gserviceaccount.com` — `roles/viewer`, `roles/artifactregistry.reader`, `roles/storage.objectViewer`
- `ci-test@mock-app-test.iam.gserviceaccount.com` — `roles/logging.logWriter`, `roles/monitoring.metricWriter`
- `test-developers@example.com` — `roles/viewer`, `roles/cloudbuild.builds.viewer`
- `test-ops@example.com` — `roles/viewer`, `roles/logging.viewer`, `roles/monitoring.viewer`

## Validation

```bash
make fmt
make validate
```

The IDs and principals are intentionally fake. Do not run `terraform apply`.
