#
# WSO2 API Manager 1.9.0
#
FROM anapsix/alpine-java
MAINTAINER Ivan Sim, ihcsim@gmail.com

RUN wget -P /opt https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2am-1.9.1.zip && \
    unzip /opt/wso2am-1.9.1.zip -d /opt && \
    rm /opt/wso2am-1.9.1.zip

EXPOSE 9443 9763 8243 8280
CMD ["/opt/wso2am-1.9.1/bin/wso2server.sh"]
