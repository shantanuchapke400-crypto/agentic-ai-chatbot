
FROM python:3.12-slim

# Prevent Python from buffering logs and creating bytecode
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY app.py agents.py database.py rag.py tools.py ./
COPY templates/ ./templates/

# Create directories for persistent application data
RUN mkdir -p /app/data /app/chroma_db /app/uploads

# Application port
EXPOSE 8080

# Start FastAPI application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
