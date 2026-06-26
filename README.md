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

- One mock Google group assigned additive IAM roles at the folder level
- One mock service account assigned additive IAM roles at the project level
- Dummy project IDs and folder IDs
- No remote backend
- No real credentials
- No `terraform apply` automation

## Existing IAM patterns

### Folder-level group

```hcl
module "folder_group_roles" {
  source = "../modules/folder_iam_member"

  folder_id = var.folder_id
  member    = "group:${var.group_email}"
  roles     = var.group_folder_roles
}
```

### Project-level service account

```hcl
module "project_service_account_roles" {
  source = "../modules/project_iam_member"

  project_id = var.project_id
  member     = "serviceAccount:${var.service_account_email}"
  roles      = var.service_account_project_roles
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
