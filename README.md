# ZeroWork Docker Container

This repository provides a Docker container with a lightweight XFCE desktop environment, Google Chrome, and the ZeroWork agent pre-installed. The container is also configured to start the ZeroWork agent automatically on startup.

## Features

- XFCE Desktop Environment
- Google Chrome browser pre-installed
- VNC Server for remote desktop access
- ZeroWork agent automatically starts with the container
- Built-in GitHub Actions workflow to automatically build and push the image to GitHub Container Registry (GHCR)

## Getting Started

### Prerequisites

- Docker and Docker Compose installed on your machine.

### How to Use

1. **Clone the repository:**

   ```bash
   git clone https://github.com/horosin/zerowork-docker.git
   cd zerowork-docker
   ```

2. **Run the container locally:**

   You can run the Docker container locally with Docker Compose. This will pull the prebuilt image from GitHub Container Registry:

   ```bash
   docker-compose up
   ```

   The VNC server will be available on port `5900`. You can connect to it using any VNC client.

3. **Access the container:**

   Open your preferred VNC viewer and connect to `localhost:5900`.

   - No password is required.
   - You should see the XFCE desktop environment.

4. **Run the ZeroWork agent:**

   The ZeroWork agent will automatically start when the container starts. You can verify that it's running by checking the processes inside the container.

### Build Locally

If you'd like to build the Docker image yourself instead of using the prebuilt image, you can do so by running:

```bash
docker-compose up --build
```

This will build the image using the Dockerfile in the repository and then start the container.

### GitHub Actions Workflow

The repository includes a GitHub Actions workflow that automatically builds the Docker image and pushes it to the GitHub Container Registry whenever changes are pushed to the `main` branch.

The prebuilt image is hosted at `ghcr.io/horosin/zerowork-docker:latest`.

### Access the Prebuilt Image

You can pull the prebuilt Docker image from the GitHub Container Registry by running:

```bash
docker pull ghcr.io/horosin/zerowork-docker:latest
```

### Configuration

- **VNC Port**: The VNC server is exposed on port `5900` by default. If you want to change this, modify the `docker-compose.yml` file.
- **ZeroWork Agent**: The ZeroWork agent is installed from the `.deb` package and starts automatically when the container starts.

## License

This repository is licensed under the MIT License.
