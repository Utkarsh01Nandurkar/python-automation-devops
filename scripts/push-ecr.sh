#!/usr/bin/env bash
set -euo pipefail

ECR_URL="$1"
IMAGE_NAME="$2"
TAG="${3:-latest}"

aws ecr get-login-password --region "${AWS_REGION:-us-east-1}" | docker login --username AWS --password-stdin "${ECR_URL}"
docker build -t "${IMAGE_NAME}:${TAG}" .
docker tag "${IMAGE_NAME}:${TAG}" "${ECR_URL}/${IMAGE_NAME}:${TAG}"
docker push "${ECR_URL}/${IMAGE_NAME}:${TAG}"
