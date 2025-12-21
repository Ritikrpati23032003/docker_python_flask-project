FROM python:latest
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
Entrypoint ["python"]
CMD ["app.py"]
