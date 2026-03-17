FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    procps \
    iproute2 \
    net-tools \
    iputils-ping \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=jmarcelocarvalho.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
  CMD python -c "from jmarcelocarvalho import app; c=app.test_client(); r=c.get('/'); raise SystemExit(0 if r.status_code == 200 else 1)"

CMD ["gunicorn", \
     "--workers", "2", \
     "--threads", "2", \
     "--timeout", "120", \
     "--graceful-timeout", "30", \
     "--keep-alive", "5", \
     "--access-logfile", "-", \
     "--error-logfile", "-", \
     "--capture-output", \
     "--bind", "0.0.0.0:5000", \
     "jmarcelocarvalho:app"]
