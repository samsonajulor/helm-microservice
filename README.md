# helm-microservice
## services
This repository contains the following microservices:
1. Authentication Service - with express and typescript
2. Plans service - with express and typescript
3. Analytics Service - with django and python

## Kubernetes and Helm
To run this app locally you should install minikube and helm

a. Install Minikube:

Follow the installation guide for your operating system from the official Minikube documentation: https://minikube.sigs.k8s.io/docs/start/

b. Start Minikube:

After installing Minikube, start the cluster by running the following command:

```bash
minikube start
```
If Minikube is not working on your Windows machine, you can try using Docker Desktop with Kubernetes enabled as an alternative.

Here's how you can set up Kubernetes using Docker Desktop on Windows:

Step 1: Install Docker Desktop

If you don't have Docker Desktop installed, download and install it from the official Docker website: https://www.docker.com/products/docker-desktop

Step 2: Enable Kubernetes in Docker Desktop

1. After installing Docker Desktop, open it from the system tray icon.

2. Go to "Settings" (gear icon) > "Kubernetes."

3. Check the "Enable Kubernetes" checkbox to enable Kubernetes on Docker Desktop.

4. Click "Apply & Restart" to save the settings and restart Docker Desktop.

Step 3: Verify Kubernetes Installation

Once Docker Desktop is restarted and Kubernetes is enabled, you can verify the Kubernetes installation by opening a command prompt or PowerShell and running the following command:

```bash
kubectl version
```
You should see the version information for both the client and server components of Kubernetes.

c. Install Helm:

Once you have a running Kubernetes cluster, you can proceed to install Helm, which is the package manager for Kubernetes.

a. Install Helm:

Follow the installation instructions provided on the Helm website for your specific operating system: https://helm.sh/docs/intro/install/

## Dockerize the application and push to docker hub
run `bash ./deploy.sh` in the root of the repository to deploy.
## deploy helm charts

Step 4: Deploy the Helm chart

In the `helm` directory, deploy the Helm chart with the following command:

```bash
helm install helm-auth ./helm-auth
```

This command will create a new Kubernetes deployment with the Express application using the values defined in `values.yaml`.

Step 5: Access the application

After the deployment is successful, you can access the application by exposing the service. By default, the service is configured as `ClusterIP`, meaning it's only accessible within the cluster. To expose the service externally, update the `service.type` in `values.yaml` to `NodePort` or `LoadBalancer`.

For example, to use `NodePort`, update `values.yaml`:

```yaml
# values.yaml
service:
  type: NodePort
  port: 3990
```

Then, upgrade the Helm release with the new configuration:

```bash
helm upgrade helm-auth ./helm-auth
```

After the upgrade, you can get the NodePort assigned to the service by running:

```bash
kubectl get svc helm-auth
```

You can access the application by navigating to `http://<node-ip>:<node-port>` in your browser, where `<node-ip>` is the IP of one of your cluster nodes, and `<node-port>` is the port you obtained from the `kubectl get svc` command.
