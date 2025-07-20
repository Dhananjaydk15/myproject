# Dockerfile
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN python manage.py collectstatic --noinput
# Gunicorn entrypoint instead of Django dev server
CMD ["gunicorn", "--config", "gunicorn.conf.py", "core.wsgi:application"]
