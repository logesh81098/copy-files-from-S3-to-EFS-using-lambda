import json
import boto3
import os
import shutil

s3 = boto3.client('s3')

# Set the EFS mount path
efs_mount_path = '/mnt/efs'

def lambda_handler(event, context):
    # Local variable store bucket name
    bucket = 's3-to-efs-logesh081098'

    try:
        # List objects in the specified S3 bucket
        response = s3.list_objects(Bucket=bucket)

        # Print the list of objects (if any)
        if 'Contents' in response:
            for obj in response['Contents']:
                print(f"Object Key: {obj['Key']}, Last Modified: {obj['LastModified']}")

            # Example: Download the first object in the list
            if len(response['Contents']) > 0:
                first_object_key = response['Contents'][0]['Key']
                download_response = s3.get_object(Bucket=bucket, Key=first_object_key)
                content = download_response['Body'].read().decode('utf-8')
                print(f"Content of the first object: {content}")

                # Store the downloaded content in the /tmp directory
                tmp_path = f'/tmp/{os.path.basename(first_object_key)}'
                with open(tmp_path, 'w') as file:
                    file.write(content)
                print(f"File stored in /tmp: {tmp_path}")

                # Copy the file from /tmp to EFS
                destination_path = os.path.join(efs_mount_path, os.path.basename(first_object_key))
                shutil.copy(tmp_path, destination_path)
                print(f"File copied to EFS: {destination_path}")

    except Exception as e:
        print(f"Error: {str(e)}")

    print('List, download, store in /tmp, and copy to EFS completed')