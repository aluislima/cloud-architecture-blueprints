# 🏛️ Cloud Architecture Blueprints

A repository for Cloud Architecture Blueprints and Infrastructure as Code (IaC) focusing on Microsoft Azure and Terraform. Features modular, reusable, and well-documented architectures, plus automated tests to ensure governance, security, and cloud best practices.

---

## 📂 Repository Structure

The project is organized in a modular way to separate reusable infrastructure components, complete architecture blueprints, and quality assurance tests.

```text
cloud-architecture-blueprints/
├── .github/workflows/   # CI/CD pipelines (Automation & Tests)
├── azure/               # Azure provider configurations and base modules
│   ├── modules/         # Reusable infrastructure components (network, compute, etc.)
│   ├── blueprints/      # End-to-end cloud architecture solutions
│   ├── secure-landing-zone/
│   └── web-app-three-tier/
└── tests/               # Automated infrastructure tests (Terratest / TF Test)

🛠️ Prerequisites
Before deploying any blueprint, ensure you have the following tools installed locally:
Terraform (>= 1.5.0)
Azure CLI
Go (>= 1.20) [Optional: Only required for running integration tests]

🚀 Quick Start
1. Authenticate to Azure
Open your terminal and log in to your Microsoft Azure account:
Bash
az login
2. Choose a Blueprint
Navigate to one of the complete architectures inside the blueprints/ directory. For example:
Bash
cd blueprints/secure-landing-zone
3. Deploy the Infrastructure
Initialize Terraform, check the execution plan, and apply the changes:
Bash
terraform init
terraform plan
terraform apply

🧪 Quality & Testing
This repository enforces infrastructure quality through multiple testing layers located in the /tests directory:
Static Analysis: Linting and security scans via tflint and tfsec.
Integration Tests: Real-world provisioning and validation using Terratest.
To learn how to run tests locally, check the Tests Documentation.

📝 License
This project is licensed under the MIT License - see the LICENSE file for details.
