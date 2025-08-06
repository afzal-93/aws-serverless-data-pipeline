import json
import boto3
import psycopg2
import os

s3 = boto3.client('s3')

def lambda_handler(event, context):
    record = event['Records'][0]
    bucket = record['s3']['bucket']['name']
    key = record['s3']['object']['key']

    obj = s3.get_object(Bucket=bucket, Key=key)
    data_str = obj['Body'].read().decode('utf-8')
    data = json.loads(data_str)

    conn = psycopg2.connect(
        host=os.environ['RDS_HOST'],
        database=os.environ['RDS_DBNAME'],
        user=os.environ['RDS_USER'],
        password=os.environ['RDS_PASSWORD']
    )
    cur = conn.cursor()

    create_table = """
    CREATE TABLE IF NOT EXISTS processed_data (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        value INTEGER,
        timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    """
    cur.execute(create_table)

    insert_stmt = "INSERT INTO processed_data (name, value) VALUES (%s, %s);"
    cur.execute(insert_stmt, (data['name'], data['value']))

    conn.commit()
    cur.close()
    conn.close()

    return {
        'statusCode': 200,
        'body': json.dumps('Data inserted into RDS successfully.')
    }
