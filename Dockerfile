FROM bitnami/python:3.9 as builder
COPY . /app
WORKDIR /app

RUN virtualenv . && \
    . bin/activate && \
    pip3 install --no-cache-dir -r requirements.txt

FROM bitnami/python:3.9-prod
COPY --from=builder /app /app

WORKDIR /app
CMD bash -c "source bin/activate && uvicorn main:app --host 0.0.0.0 --port 8000"
