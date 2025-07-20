# Dockerfile
<<<<<<< HEAD
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the project
COPY . .

# Run development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
=======
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN python manage.py collectstatic --noinput
# Gunicorn entrypoint instead of Django dev server
CMD ["gunicorn", "--config", "gunicorn.conf.py", "core.wsgi:application"]
>>>>>>> f99c4a7 (nginx)
