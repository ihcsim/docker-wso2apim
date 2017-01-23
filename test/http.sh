#!/bin/bash

API_MANAGER_HOST=${API_MANAGER_HOST:-localhost}
MAX_RETRIES=${MAX_RETRIES:-10}

http_ok=200
failed=false

admin_console_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/carbon`
until [ ${admin_console_response} != "000" ] || [ ${retries} -eq ${MAX_RETRIES} ]; do
  echo "Waiting for Admin Console at https://${API_MANAGER_HOST}:9443/carbon to be ready... Retries ${retries}"
  sleep 5
  retries=$((retries + 1))
  admin_console_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/carbon`
done

if [ ${admin_console_response} != ${http_ok} ];
then
  echo -e "\033[0;31mAdmin Console at https://${API_MANAGER_HOST}:9443/carbon is unreachable. Received HTTP response ${admin_console_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

publisher_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/publisher`
until [ ${publisher_response} != "000" ] || [ ${retries} -eq ${MAX_RETRIES} ]; do
  echo "Waiting for Publisher at https://${API_MANAGER_HOST}:9443/publisher to be ready... Retries ${retries}"
  sleep 2
  retries=$((retries + 1))
  publisher_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/publisher`
done

if [ ${publisher_response} != ${http_ok} ];
then
  echo -e "\033[0;31mPublisher at https://${API_MANAGER_HOST}:9443/publisher is unreachable. Received HTTP response ${publisher_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

store_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/store`
until [ ${store_response} != "000" ] || [ ${retries} -eq ${MAX_RETRIES} ]; do
  echo "Waiting for API Store at https://${API_MANAGER_HOST}:9443/store to be ready... Retries ${retries}"
  sleep 2
  retries=$((retries + 1))
  store_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/store`
done

if [ ${store_response} != ${http_ok} ];
then
  echo -e "\033[0;31mAPI Store at https://${API_MANAGER_HOST}:9443/store is unreachable. Received HTTP response ${store_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

if ${failed} ;
then
  echo -e "\033[0;31mTest failed.\033[0m"
  exit 1
fi
echo -e "\033[0;32mTest passed.\033[0m"
