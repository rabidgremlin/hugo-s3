# hugo-s3
Docker container that can build a hugo site from a git repo and push it to a s3 bucket.

## usage

```
$ docker pull rabidgremlin/hugo-s3
$ docker run rabidgremlin/hugo-s3
Usage:
      docker run rabidgremlin/hugo-s3 <git url> <s3 bucket name> <AWS access key> <AWS secret key>
$ docker run rabidgremlin/hugo-s3 https://github.com/rabidgremlin/hugo-s3-test.git hugo-s3-test AxxxxxxxxxxxxxxxxxxxA jyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyn
```

Any parameters passed the first 4 are passed to hugo. For instnace to override the *baseurl* you can pass the *-b* parameters as follows:

``
$ docker run rabidgremlin/hugo-s3 https://github.com/rabidgremlin/hugo-s3-test.git hugo-s3-test AxxxxxxxxxxxxxxxxxxxA jyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyn`-b http://hugo-s3-test.s3xxxxxxxxxxxxxxxxxxxx.amazonaws.com/
```
