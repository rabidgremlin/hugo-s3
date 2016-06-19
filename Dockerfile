FROM ubuntu

RUN apt-get -y update && \
    apt-get -y install hugo python-pip git && \
    pip install awscli && \
    pip install pygments

COPY hugo-s3.sh /
RUN chmod +x /hugo-s3.sh

ENTRYPOINT ["/hugo-s3.sh"]
