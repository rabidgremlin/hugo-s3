FROM ubuntu

RUN apt-get -y update && \
    apt-get -y install hugo python-pip git && \
    pip install awscli 
    
    



