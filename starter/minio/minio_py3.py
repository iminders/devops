# https://docs.min.io/docs/python-client-quickstart-guide
# pip3 install minio
import os

from minio import Minio
from minio.error import (BucketAlreadyExists, BucketAlreadyOwnedByYou,
                         ResponseError)

access_key = os.getenv("MINIO_ACCESS_KEY")
secret_key = os.getenv("MINIO_SECRET_KEY")

minioClient = Minio(
    'iminders:7000',
    access_key=access_key,
    secret_key=secret_key,
    secure=False)

# Make a bucket with the make_bucket API call.
try:
    if not minioClient.bucket_exists('test1'):
        minioClient.make_bucket("test1")
except BucketAlreadyOwnedByYou as err:
    pass
except BucketAlreadyExists as err:
    pass
except ResponseError as err:
    raise

# Put an object test.log with contents from /tmp/test.log
try:
    minioClient.fput_object(
        'test1', 'test/2020.zip', '/Users/liuwen/Downloads/2020.zip')
    minioClient.fput_object(
        'test1', 'test/abc/2020.zip', '/Users/liuwen/Downloads/2020.zip')
except ResponseError as err:
    print(err)


try:
    data = minioClient.get_object('test1', 'test/2020.zip')
    with open('/Users/liuwen/Downloads/test.zip', 'wb') as file_data:
        for d in data.stream(32*1024):
            file_data.write(d)
except ResponseError as err:
    print(err)


# Remove an object.
try:
    minioClient.remove_object('test1', 'test1/test.log')
except ResponseError as err:
    print(err)

# List all object paths in bucket that begin with my-prefixname using
# V2 listing API.
objects = minioClient.list_objects_v2('test1', prefix='test', recursive=True)

for obj in objects:
    print(obj.bucket_name, obj.object_name.encode('utf-8'), obj.last_modified,
          obj.etag, obj.size, obj.content_type)
