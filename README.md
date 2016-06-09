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
