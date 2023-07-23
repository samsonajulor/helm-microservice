#!/bin/bash

# Function to build, run, and push a Docker image
build_run_push() {
  app_name=$1
  dockerfile_path=$2
  tag=$3
  port=$4

  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "Building, running, and pushing $app_name Docker image... on port $port"

  # Build the Docker image
  docker build -t "$app_name:$tag" -f "$dockerfile_path" .

  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "Built $app_name Docker image on port $port"

  # Run the Docker container (optional)
  # docker run -d -p "$port:$port" "$app_name:$tag"

  # Tag the image for Docker Hub
  docker tag "$app_name:$tag" "samsonajulor/$app_name:$tag"

  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "Tagged $app_name Docker image on port $port"

  # Push the image to Docker Hub
  docker push "samsonajulor/$app_name:$tag"

  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "----------------------------------------------------------------------"
  echo "Pushed $app_name Docker image on port $port as samsonajulor/$app_name:$tag"
}

# Build, run, and push the images for the three applications
build_run_push "helm-auth" "./authentication_service/Dockerfile" "latest" "3990"
build_run_push "helm-analytics" "./analytics_service/analytics_service/Dockerfile" "latest" "8000"
build_run_push "helm-plans" "./plans_service/Dockerfile" "latest" "3991"

# Output the URLs to the Docker repository

echo "----------------------------------------------------------------------"
echo "----------------------------------------------------------------------"
echo "----------------------------------------------------------------------"
echo "Docker repository URLs:"
echo "Helm Auth: docker.io/samsonajulor/helm-auth:latest"
echo "Helm Analytics: docker.io/samsonajulor/helm-analytics:latest"
echo "Helm Plans: docker.io/samsonajulor/helm-plans:latest"
