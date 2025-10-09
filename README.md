# 🧠 AXOLOTL Tracer Demo

Docker Compose setup for running the **Axolotl Tracer demo**

---

## 📦 Services

| Service | Description |
|----------|-------------|
| **backend** | FastAPI application exposing the tracer API. |
| **rq_worker** | RQ worker pool processing tracing and conversion jobs. |
| **redis_db** | Redis instance used as message broker and queue backend. |
| **rq_dashboard** | Web dashboard to monitor RQ jobs. |
| **sftp** | Lightweight SFTP server for uploading volumes and requests. |
| *(optional)* **redis_insight** | (Commented out) RedisInsight UI for visual inspection of Redis data. |

---

## ⚙️ Environment Variables

All paths and ports are configurable through environment variables.  
You can define them in a `.env` file in the same directory as `compose.yml`:

```env
# Ports
BACKEND_PORT=8000
RQ_DASHBOARD_PORT=9181

# Directories (mounted as volumes)
UPLOADS_DIR=./uploads
REQUESTS_DIR=./requests
VOLUMES_DIR=./volumes
PARAMETERS_DIR=./parameters

# Worker options
ENABLE_PARAMETERS_LOGGING=false

# SFTP credentials
SFTP_USER=uploaduser
SFTP_PASSWORD=uploadpass
SFTP_UID=1000
```

---

## 🚀 Usage

### 1. Clone the repository

```[bash]
git clone https://github.com/<your-org>/axltracer_demo.git
cd axltracer_demo
```

### 2. Create the required folders

```[bash]
mkdir -p uploads requests volumes parameters
```

### 3. (Optional) Create your `.env` file
If you want to override the defaults, create a `.env` file as shown above.

### 4. Start the stack
```[bash]
docker compose up -d
docker compose start
```
### 5. Access the services

| Service                | URL                                                      |
| ---------------------- | -------------------------------------------------------- |
| Backend (FastAPI docs) | [http://localhost:8000/docs](http://localhost:8000/docs) |
| RQ Dashboard           | [http://localhost:9181](http://localhost:9181)           |
| SFTP                   | `sftp://uploaduser@localhost:2222`                       |

---

## 🐋 Registry 
All core images are pulled from the private registry:
```[bash]
registry.axltracer.it
```

---

© 2025 Bioretics SRL, Filippo Maria Castelli, Ph.D.

`castelli@bioretics.com` 

Project **AXOLOTL** **AX**ons **L**ong **T**racing via **L**ightSheet

We acknowledge the financial support from PNRR Tuscany Health Ecosystem Project ECS_00000017 Bando a cascata rivolto a imprese - Spoke 8 Biotechnologies and Imaging in Neuroscience

##