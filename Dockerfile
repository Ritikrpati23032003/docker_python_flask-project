FROM python:latest
COPY . /app
WORKDIR /app

EXPOSE 5000
CMD ["python", "app.py"]
