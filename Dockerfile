# Dockerfile

# 1. Base image
FROM python:3.10-slim

# 2. Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3. Set work directory
WORKDIR /app

# 4. Install dependencies
COPY app/requirements.txt .
RUN pip install --upgrade pip
RUN pip install --default-timeout=100 -r requirements.txt


# 5. Copy project files
COPY app .

# 6. Default command (will be overridden in docker-compose)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


