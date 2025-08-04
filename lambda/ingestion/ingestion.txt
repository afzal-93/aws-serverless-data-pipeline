import json
import boto3
import uuid

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket_name = "my-raw-data-bucket-afzal-123"  # Change this to your bucket name
    file_key = f"{uuid.uuid4()}.json"

    # Simulated data
    data = {
        "name": "Sample Name",
        "value": 42,
    }

    body = json.dumps(data)
    s3.put_object(Bucket=bucket_name, Key=file_key, Body=body)

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Data stored in S3", "file": file_key})
    }
