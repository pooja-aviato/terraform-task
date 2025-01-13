FROM python:3.10-slim
ENV PYTHONUNBUFFERED True

WORKDIR /app
COPY . .

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

CMD exec gunicorn --bind :$PORT --workers 1 --threads 4 -k uvicorn.workers.UvicornWorker --timeout 0 main:app