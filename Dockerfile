FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    FLASK_APP=jmarcelocarvalho.py

# Criar user app (não usar root por segurança)
RUN groupadd --system --gid 10001 app \
 && useradd --system --uid 10001 --gid app --home-dir /app --shell /usr/sbin/nologin app

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY --chown=app:app . .
RUN chmod 0755 /app/docker-entrypoint.sh

USER app
EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
  CMD python -c "import requests; r=requests.get('http://localhost:5000/'); exit(0 if r.status_code == 200 else 1)"

ENTRYPOINT ["/app/docker-entrypoint.sh"]
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
