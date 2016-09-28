FROM isim/oraclejava:1.8.0_101
MAINTAINER Ivan Sim, ihcsim@gmail.com

RUN wget -P /opt https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2am-2.0.0.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2am-2.0.0.zip -d /opt && \
    rm /opt/wso2am-2.0.0.zip

EXPOSE 9443 9763 8243 8280 10397 7711
ENTRYPOINT ["/opt/wso2am-2.0.0/bin/wso2server.sh"]

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ihcsim/docker-wso2apim"
