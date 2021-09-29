import boto3
from fastapi import FastAPI

app = FastAPI()
s3 = boto3.resource('s3')


@app.get("/")
async def root():
    return {"buckets": ",".join(bucket.name for bucket in s3.buckets.all())}
