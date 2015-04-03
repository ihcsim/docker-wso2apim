#
# WSO2 API Manager 1.6.0
#
FROM java:7
MAINTAINER Ivan Sim, ihcsim@gmail.com

RUN wget -P /opt https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2am-1.6.0.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2am-1.6.0.zip -d /opt && \
    rm /opt/wso2am-1.6.0.zip

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
EXPOSE 9443
CMD ["/opt/wso2am-1.6.0/bin/wso2server.sh"]
