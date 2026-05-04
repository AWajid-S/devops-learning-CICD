# Project 2 — Terraform Linting Pipeline with GitHub Actions

## Objective

Build an automated CI pipeline that validates Terraform code formatting using GitHub Actions.

This project demonstrates how linting can be enforced automatically on every code change, ensuring Terraform files follow consistent formatting standards before being accepted.

---

## Architecture Overview

This project uses GitHub Actions to automatically check Terraform code quality.

The pipeline performs the following actions whenever code is pushed to the `main` branch:

- Checks out the repository code
- Installs Terraform
- Runs `terraform fmt -check` to validate formatting

If formatting issues are detected, the pipeline fails. Once corrected, the pipeline passes successfully.

---

## CI/CD Pipeline Design

### GitHub Actions Workflow

The pipeline is defined inside:

`.github/workflows/task-2-terraform-lint.yaml`

GitHub Actions automatically detects workflows in this directory and executes them based on triggers.

---

### Pipeline Trigger

The workflow runs automatically on every push to the `main` branch.

This ensures all Terraform changes are validated immediately.

---

### Terraform Linting (Formatting Check)

The pipeline uses:

```bash
terraform fmt -check -recursive
```

This command:

- Checks whether Terraform files are properly formatted
- Does not modify files
- Returns a failure if formatting is incorrect

---

## Terraform Code

A simple Terraform configuration is used for demonstration:

- AWS provider configuration
- Example S3 bucket resource

The goal is not infrastructure deployment, but to provide valid Terraform code that can be linted.

---

## Deployment Process

### 1. Introduce Formatting Issues

Terraform code was intentionally written with incorrect formatting to simulate real-world mistakes.

### 2. Push Code to GitHub

```bash
git add .
git commit -m "Add Terraform linting pipeline with formatting issues"
git push
```

### 3. Pipeline Execution

GitHub Actions automatically:

- Starts a runner
- Installs Terraform
- Runs formatting checks

The pipeline fails due to formatting issues.

### 4. Fix Formatting

Formatting is corrected using:

```bash
terraform fmt
```

### 5. Push Fix

```bash
git add .
git commit -m "Fix Terraform formatting"
git push
```

### 6. Pipeline Passes

The pipeline re-runs and succeeds after formatting is corrected.

---

## Testing & Validation

- Verified GitHub Actions workflow triggers on push
- Confirmed Terraform formatting check runs automatically
- Verified pipeline fails when formatting is incorrect
- Confirmed pipeline passes after formatting is fixed
- Ensured consistent Terraform formatting across files

---

## Screenshots

Screenshots documenting the pipeline process are available in the `/screenshots` directory, including:

- Terraform formatting failure in CI pipeline
- Local fix using `terraform fmt`
- Successful pipeline execution after fix

---

## What I Learned

- How Terraform formatting standards are enforced using CI/CD
- How `terraform fmt -check` works in automated pipelines
- How GitHub Actions integrates with Terraform workflows
- The importance of linting in maintaining clean and readable code
- How CI pipelines detect and prevent poorly formatted code from being merged
- The real-world workflow of fail → fix → pass

---

## Error Handling & Debugging

During development, the pipeline initially failed due to incorrectly formatted Terraform code.

This was identified through GitHub Actions logs in the formatting check step.

The issue was resolved by running:

```bash
terraform fmt
```

This reformatted the code automatically to meet Terraform standards.

After committing and pushing the corrected code, the pipeline passed successfully.

This demonstrated the importance of:

- Automated linting in CI pipelines
- Reading pipeline logs to identify issues
- Fixing issues locally before re-running pipelines

---

## Result

The final pipeline now automatically:

- Checks Terraform formatting
- Fails on incorrect formatting
- Passes when code is properly formatted

This project demonstrates how CI/CD pipelines can enforce code quality standards using Terraform linting.
