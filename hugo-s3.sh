#!/bin/bash

if [ $# -lt 4 ] ; then
  echo "Usage:"
  echo "      docker run rabidgremlin/hugo-s3 <git url> <s3 bucket name> <AWS access key> <AWS secret key>"
  exit 1;
fi

git clone $1 site
cd site
hugo
cd public

export AWS_ACCESS_KEY_ID=$3
export AWS_SECRET_ACCESS_KEY=$4

aws s3 sync . s3://$2/ --delete
