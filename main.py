import boto3
from fastapi import FastAPI

app = FastAPI()
sts = boto3.client('sts')


@app.get("/")
async def root():
    return sts.get_caller_identity()
