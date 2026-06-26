# Terraform IAM Form Test Repository

A small mock Terraform repository for testing the Product Forge
**Terraform IAM Roles Management** workflow.

## Structure

```text
terraform-iam-form-test/
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

- One mock Google group assigned additive IAM roles at the folder level
- One mock service account assigned additive IAM roles at the project level
- Dummy project IDs and folder IDs
- No remote backend
- No real credentials
- No `terraform apply` automation

## Existing IAM patterns

### Folder-level group

```hcl
resource "google_folder_iam_member" "group_roles" {
  for_each = var.group_folder_roles

  folder = var.folder_id
  role   = each.value
  member = "group:${var.group_email}"
}
```

### Project-level service account

```hcl
resource "google_project_iam_member" "service_account_roles" {
  for_each = var.service_account_project_roles

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${var.service_account_email}"
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

Project service account:

- `workflow-dev@mock-app-dev.iam.gserviceaccount.com`
- `roles/viewer`
- `roles/artifactregistry.reader`
- `roles/storage.objectViewer`

### Test

Folder group:

- `test-platform@example.com`
- `roles/browser`
- `roles/logging.viewer`
- `roles/monitoring.viewer`

Project service account:

- `workflow-test@mock-app-test.iam.gserviceaccount.com`
- `roles/viewer`
- `roles/artifactregistry.reader`
- `roles/storage.objectViewer`

## Validation

```bash
make fmt
make validate
```

The IDs and principals are intentionally fake. Do not run `terraform apply`.
