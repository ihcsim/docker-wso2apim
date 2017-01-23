#!/bin/bash

API_MANAGER_HOST=${API_MANAGER_HOST:-localhost}
http_ok=200
failed=false

admin_console_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/carbon`
until [ ${admin_console_response} != "000" ]; do
  echo "Waiting for Admin Console to be ready...${admin_console_response}"
  sleep 2
  admin_console_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/carbon`
done

if [ ${admin_console_response} != ${http_ok} ];
then
  echo -e "\033[0;31mAdmin Console is unreachable. Received HTTP response ${admin_console_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

publisher_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/publisher`
until [ ${publisher_response} != "000" ]; do
  echo "Waiting for Publisher to be ready..."
  sleep 2
  publisher_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/publisher`
done

if [ ${publisher_response} != ${http_ok} ];
then
  echo -e "\033[0;31mPublisher is unreachable. Received HTTP response ${publisher_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

store_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/store`
until [ ${store_response} != "000" ]; do
  echo "Waiting for API Store to be ready..."
  sleep 2
  store_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/store`
done

if [ ${store_response} != ${http_ok} ];
then
  echo -e "\033[0;31mAPI Store is unreachable. Received HTTP response ${store_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

if ${failed} ;
then
  echo -e "\033[0;31mTest failed.\033[0m"
  exit 1
fi
echo -e "\033[0;32mTest passed.\033[0m"
