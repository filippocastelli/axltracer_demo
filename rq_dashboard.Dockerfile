FROM python:3.12-slim

SHELL ["sh", "-exc"]

ENV DEBIAN_FRONTEND=noninteractive

RUN <<EOT
apt-get update -qy
apt-get upgrade -y
apt-get clean
rm -rf /var/lib/apt/lists/*
EOT

# Run the app as non-root user.
RUN <<EOT
groupadd -r app
useradd -r -d /app -g app -N app
EOT

USER app

WORKDIR /app

RUN python -m venv .venv
RUN .venv/bin/python -m pip install --no-cache-dir rq-dashboard

EXPOSE 9181

ENTRYPOINT [".venv/bin/rq-dashboard"]
