#!/bin/bash

# check we have at least 4 args
if [ $# -lt 4 ] ; then
  echo "Usage:"
  echo "      docker run rabidgremlin/hugo-s3 <git url> <s3 bucket name> <AWS access key> <AWS secret key>"
  exit 1;
fi

# grab the key args
giturl=$1
s3bucketname=$2
awsaccesskey=$3
awssecretkey=$4

# consume first 4 args so rest can be passed to hugo
shift
shift
shift
shift

# pull siet from git
git clone $giturl site

# execute hugo
cd site
hugo $@

# upload generated content to S3 bucket
cd public

export AWS_ACCESS_KEY_ID=$awsaccesskey
export AWS_SECRET_ACCESS_KEY=$awssecretkey

aws s3 sync . s3://$s3bucketname/ --delete
