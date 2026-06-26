# Terraform IAM Form Test Repository

A small mock Terraform repository for testing the Product Forge
**Terraform IAM Roles Management** workflow.

## Structure

```text
terraform-iam-form-test/
├── modules/
│   └── iam/
│       ├── versions.tf
│       ├── variables.tf
│       ├── main.tf
│       └── outputs.tf
├── dev/
│   ├── providers.tf
│   ├── variables.tf
│   ├── iam.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── test/
│   ├── providers.tf
│   ├── variables.tf
│   ├── iam.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── .gitignore
└── Makefile
```

The IAM functionality lives in the shared `modules/iam` module. Each environment
(`dev/`, `test/`) calls that module and supplies environment-specific values via
`terraform.tfvars`.

Each environment provides:

- One mock Google group assigned additive IAM roles at the folder level
- One mock service account assigned additive IAM roles at the project level
- Dummy project IDs and folder IDs
- No remote backend
- No real credentials
- No `terraform apply` automation

## `modules/iam`

The shared IAM module manages additive Google Cloud IAM member bindings for a
mock folder group and a mock project service account. Environments do not define
IAM resources directly; they call this module and pass in environment-specific
values from `terraform.tfvars`.

### Resources

**Folder-level group**

```hcl
resource "google_folder_iam_member" "group_roles" {
  for_each = var.group_folder_roles

  folder = var.folder_id
  role   = each.value
  member = "group:${var.group_email}"
}
```

**Project-level service account**

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

### Inputs

| Name | Type | Description |
|------|------|-------------|
| `project_id` | `string` | Mock Google Cloud project ID |
| `folder_id` | `string` | Mock Google Cloud folder resource name |
| `group_email` | `string` | Google group receiving folder-level IAM roles |
| `group_folder_roles` | `set(string)` | Folder-level roles assigned to the group |
| `service_account_email` | `string` | Service account receiving project-level IAM roles |
| `service_account_project_roles` | `set(string)` | Project-level roles assigned to the service account |

### Outputs

| Name | Description |
|------|-------------|
| `folder_group_assignments` | Map of folder-level role assignments for the group |
| `project_service_account_assignments` | Map of project-level role assignments for the service account |

Each environment re-exports these module outputs from its own `outputs.tf`.

### Usage

Each environment calls the module from `iam.tf`:

```hcl
module "iam" {
  source = "../modules/iam"

  project_id                    = var.project_id
  folder_id                     = var.folder_id
  group_email                   = var.group_email
  group_folder_roles            = var.group_folder_roles
  service_account_email         = var.service_account_email
  service_account_project_roles = var.service_account_project_roles
}
```

Environment outputs pass through the module results:

```hcl
output "folder_group_assignments" {
  description = "Folder-level IAM assignments for the mock group."
  value       = module.iam.folder_group_assignments
}

output "project_service_account_assignments" {
  description = "Project-level IAM assignments for the mock service account."
  value       = module.iam.project_service_account_assignments
}
```

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
