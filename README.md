# GitHub Actions CI/CD Pipeline (Demo)


github-actions-cicd/
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── app/
│   ├── app.py
│   └── requirements.txt
├── tests/
│   └── test_app.py
├── Dockerfile
├── .dockerignore
├── .gitignore
├── README.md
└── scripts/
    └── push-ecr.sh    (optional helper)




This repository demonstrates a CI/CD pipeline using GitHub Actions:
- Lint & unit tests (pytest)
- Build Docker image
- Push Docker image to Amazon ECR
- Run Terraform plan for infra (optional)

## Quick start

1. Create GitHub repo and push this code.
2. Add repository secrets (Settings → Secrets):
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY
   - AWS_REGION
   - ECR_REGISTRY (e.g. 123456789012.dkr.ecr.us-east-1.amazonaws.com)
   - IMAGE_NAME (e.g. utk-app-repo)
3. Ensure the IAM user has appropriate permissions (ECR, EKS, EC2, IAM, VPC).
4. On PRs, the `test` job will run. On push to `main`, images will be built and pushed and terraform plan will run.

## Local test
Run tests locally:
```bash
python -m venv venv
source venv/bin/activate
pip install -r app/requirements.txt
pytest -q
