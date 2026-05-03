# Project 1 — Docker CI/CD Pipeline with GitHub Actions

## Objective

Build a fully automated CI/CD pipeline using GitHub Actions, Docker, and Docker Hub.

This project demonstrates how Continuous Integration and Continuous Deployment workflows can automatically test applications, build Docker images, and publish those images to a container registry without manual intervention.

---

## Architecture Overview

This project uses GitHub Actions to automate the software delivery workflow.

The pipeline performs the following actions automatically whenever code is pushed to the `main` branch:

- Checks out the repository code
- Sets up a Python environment
- Installs project dependencies
- Runs automated tests using Pytest
- Builds a Docker image
- Pushes the Docker image to Docker Hub

The project demonstrates a basic real-world CI/CD workflow commonly used in DevOps environments.

---

## CI/CD Pipeline Design

### GitHub Actions Workflow

The pipeline is defined inside:

`.github/workflows/task-1-docker-ci.yaml`

GitHub Actions automatically detects workflows stored in this directory and executes them based on defined triggers.

---

### Pipeline Trigger

The workflow is configured to run automatically on every push to the `main` branch.

This ensures the pipeline executes automatically whenever new code changes are pushed.

---

### Python Test Automation

The workflow installs dependencies from:

`requirements.txt`

Automated tests are then executed using:

`pytest`

This validates that the application behaves correctly before the Docker image is built.

---

### Docker Image Build

The pipeline automatically builds a Docker image using the provided Dockerfile.

This creates a lightweight containerized version of the application.

---

### Docker Hub Deployment

The pipeline securely authenticates to Docker Hub using GitHub Secrets.

Configured secrets:

- `DOCKER_USERNAME`
- `DOCKER_TOKEN`

After authentication, the workflow pushes the Docker image automatically to Docker Hub.

Published image:

`awajids/helloapp:latest`

---

## Deployment Process

### 1. Install Dependencies Locally

```bash
python3 -m pip install -r requirements.txt
```

### 2. Run Tests Locally

```bash
python3 -m pytest
```

### 3. Push Code to GitHub

```bash
git add .
git commit -m "Add Docker CI/CD pipeline"
git push
```

### 4. GitHub Actions Automatically

- Creates a temporary Ubuntu runner
- Installs dependencies
- Runs automated tests
- Builds Docker image
- Pushes Docker image to Docker Hub

---

## Testing & Validation

- Verified GitHub Actions workflow triggered automatically on push
- Confirmed Python dependencies installed successfully
- Confirmed automated tests executed successfully
- Verified Docker image built successfully
- Confirmed Docker Hub authentication succeeded
- Verified Docker image pushed successfully to Docker Hub
- Confirmed Docker repository updated with latest image tag

---

## Screenshots

Screenshots documenting the CI/CD pipeline process are available in the `/screenshots` directory, including:

- Initial pipeline failure caused by empty Dockerfile
- Successful GitHub Actions workflow execution
- Successful Docker Hub push workflow
- Docker image published to Docker Hub

---

## Security Configuration

GitHub Secrets were used to securely store Docker Hub credentials.

Configured secrets:

- `DOCKER_USERNAME`
- `DOCKER_TOKEN`

This prevents sensitive credentials from being exposed directly inside the workflow YAML file.

---

## What I Learned

- How GitHub Actions workflows operate
- How CI/CD pipelines automate software delivery
- How GitHub runners execute workflows using temporary Linux virtual machines
- How automated testing improves deployment reliability
- How Docker images are built automatically in CI pipelines
- How GitHub Secrets securely manage credentials
- How Docker Hub authentication works inside GitHub Actions
- How container images are tagged and pushed to registries
- How workflow stages isolate failures for easier troubleshooting

---

## Error Handling & Debugging

During development, the pipeline initially failed during the Docker build stage.

Error:

```text
the Dockerfile cannot be empty
```

The issue occurred because the Dockerfile had been created as an empty placeholder file during initial project setup.

This issue was identified through the GitHub Actions logs during the `Build Docker image` stage.

After adding valid Dockerfile instructions and pushing the changes again, the pipeline completed successfully.

This demonstrated the importance of:

- Reading CI/CD logs carefully
- Breaking workflows into clear stages
- Using automated pipelines to catch issues early
- Testing deployment workflows incrementally

---

## Result

The final CI/CD pipeline now automatically:

- Runs tests
- Builds Docker images
- Pushes images to Docker Hub

every time code is pushed to the `main` branch.

This project demonstrates a complete beginner-to-intermediate DevOps CI/CD workflow using GitHub Actions and Docker.
