FROM isim/oraclejava:1.8.0_101

image:
  FROM +labels
  ARG APIM_VERSION=${APIM_VERSION:-2.1.0-update14}
  WORKDIR /opt/wso2am-${APIM_VERSION}
  RUN --mount=type=cache,target=/tmp wget -P /tmp https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2am-${APIM_VERSION}.zip && \
      apt-get update && \
      apt-get install -y zip && \
      apt-get clean && \
      unzip /tmp/wso2am-${APIM_VERSION}.zip -d /opt
  EXPOSE 9443 9763 8243 8280 10397 7711
  ENTRYPOINT ["bin/wso2server.sh"]
  VOLUME /opt/wso2am-${APIM_VERSION}/repository/database
  SAVE IMAGE wso2am:${APIM_VERSION}

labels:
  ARG EARTHLY_GIT_HASH
  LABEL org.label-schema.vcs-ref=${EARTHLY_GIT_HASH} \
        org.label-schema.vcs-url="https://github.com/ihcsim/docker-wso2apim"
  SAVE IMAGE

test-image:
  FROM appropriate/curl
  COPY test/http.sh /opt/http.sh
  ENTRYPOINT ["/bin/sh", "/opt/http.sh"]
  SAVE IMAGE wso2am-test
