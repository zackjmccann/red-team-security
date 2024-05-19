# Red Team Security
The exploration of an environment for Red Team Security tasks and testings.

## Architecture
Two services are built via `compose.yml`, comprising the infrastructure:

`web`
A frontend web server, orchestrated by Flask. This service is built via the `Dockerfile`, which does the following:
- Installs a few useful packages such as `make`, `gcc`, `musl-dev`, and `linux-headers`
- Downloads `uv` package manager as an optimized replacement for pip (which is then used to install requirements)
- Downloads and installs a metasploit framework

`redis`: A simple redis db

The final line of the Dockerfile starts the web server on http://localhost:8000/

## Getting Started
1. Install Docker on machine
2. Create `.env` file from template, providing `FLASK_APP` and `FLASK_RUN_HOST` variable declarations_
3. Build and run multi-container application with 'docker compose up'
4. Navigate to http://localhost:8000/ to interact with application
