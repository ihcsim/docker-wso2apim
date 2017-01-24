#!/bin/bash

API_MANAGER_HOST=${API_MANAGER_HOST:-localhost}
MAX_RETRIES=${MAX_RETRIES:-10}

http_ok=200
failed=false

admin_console_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/carbon`
retries=0
until [ "${admin_console_response}" != "000" ] && [ "${admin_console_response}" != "404" ] || [ ${retries} -eq ${MAX_RETRIES} ]; do
  retries=$((retries + 1))
  echo "Waiting for Admin Console at https://${API_MANAGER_HOST}:9443/carbon to be ready... Retries ${retries}"
  sleep 2
  admin_console_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/carbon`
done

if [ "${admin_console_response}" != ${http_ok} ];
then
  echo -e "\033[0;31mAdmin Console at https://${API_MANAGER_HOST}:9443/carbon is unreachable. Received HTTP response ${admin_console_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

publisher_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/publisher`
retries=0
until [ "${publisher_response}" != "000" ] && [ "${publisher_response}" != "404" ] || [ ${retries} -eq ${MAX_RETRIES} ]; do
  retries=$((retries + 1))
  echo "Waiting for Publisher at https://${API_MANAGER_HOST}:9443/publisher to be ready... Retries ${retries}"
  sleep 2
  publisher_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/publisher`
done

if [ "${publisher_response}" != ${http_ok} ];
then
  echo -e "\033[0;31mPublisher at https://${API_MANAGER_HOST}:9443/publisher is unreachable. Received HTTP response ${publisher_response}. To view the API Manager container logs, run the \"docker logs\" command.\033[0m"
  failed=true
fi

store_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/store`
retries=0
until [ "${store_response}" != "000" ] && [ "${store_response}" != "404" ] || [ ${retries} -eq ${MAX_RETRIES} ]; do
  retries=$((retries + 1))
  echo "Waiting for API Store at https://${API_MANAGER_HOST}:9443/store to be ready... Retries ${retries}"
  sleep 2
  store_response=`curl -k -s -L -w %{http_code} -o /dev/null https://${API_MANAGER_HOST}:9443/store`
done

if [ "${store_response}" != ${http_ok} ];
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
