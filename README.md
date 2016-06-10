# hugo-s3
Docker container that can build a hugo site from a git repo and push it to a s3 bucket.

Should be useable in build tools such as Bitbucket Pipelines and Werker workflows.

## usage

```
$ docker pull rabidgremlin/hugo-s3
$ docker run rabidgremlin/hugo-s3
Usage:
      docker run rabidgremlin/hugo-s3 <git url> <s3 bucket name> <AWS access key> <AWS secret key>
$ docker run rabidgremlin/hugo-s3 https://github.com/rabidgremlin/hugo-s3-test.git hugo-s3-test AxxxxxxxxxxxxxxxxxxxA jyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyn
```

Any parameters after the first 4 are passed onto Hugo. For instance to override the *baseurl* you can pass the *-b* parameter to Hugo as follows:

```
$ docker run rabidgremlin/hugo-s3 https://github.com/rabidgremlin/hugo-s3-test.git hugo-s3-test AxxxxxxxxxxxxxxxxxxxA jyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyn -b http://hugo-s3-test.s3xxxxxxxxxxxxxxxxxxxx.amazonaws.com/
```

## using the container in a Bitbucket Pipeline
To use this container in a [Bitbucket Pipeline](https://confluence.atlassian.com/bitbucket/bitbucket-pipelines-beta-792496469.html) create a file named _bitbucket-pipelines.yml_ in the root of your Hugo source tree with the following contents:

```
image: rabidgremlin/hugo-s3

pipelines:
  default:
    - step:
        script:          
          - hugo -b $BASE_URL
          - cd public
          - export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
          - export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
          - aws s3 sync . s3://$S3_BUCKET/ --delete
```

Then under your project's settings configure _S3_BUCKET_, _AWS_ACCESS_KEY_ID_, _AWS_SECRET_ACCESS_KEY_ and _BASE_URL_ environment variables. See [here](https://confluence.atlassian.com/bitbucket/environment-variables-in-bitbucket-pipelines-794502608.html) for more information. *Note* the _BASE_URL_ varaible is optional and only needed if you want to override it for your build/branch. You can remove it from the call to hugo in _bitbucket-pipelines.yml_ if you do not need it.

