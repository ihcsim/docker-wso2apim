# docker-wso2apim
[ ![Codeship Status for ihcsim/docker-wso2apim](https://app.codeship.com/projects/f9f472e0-c271-0134-3993-22c030d3a647/status?branch=master)](https://app.codeship.com/projects/197444) [![](https://images.microbadger.com/badges/version/isim/wso2apim:2.0.0.svg)](https://microbadger.com/images/isim/wso2apim:2.0.0 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/isim/wso2apim:2.0.0.svg)](https://microbadger.com/images/isim/wso2apim:2.0.0 "Get your own commit badge on microbadger.com") [![](https://images.microbadger.com/badges/image/isim/wso2apim:2.0.0.svg)](https://microbadger.com/images/isim/wso2apim:2.0.0 "Get your own image badge on microbadger.com")

Docker image to install and run WSO2 API Manager.

## Description
The Dockerfile will:
* Use `wget` to pull the WSO2 API Manager 2.1.0 zip file from a S3 bucket into the container `/opt` folder.
* Install `zip`.
* Unzip the APIM 2.1.0 ZIP.
* Remove the APIM 2.1.0 ZIP.
* Expose the container port `9443`, `9736`, `8243`, `8280`, `10397`, `7711`.
* Set the `wso2server.sh` start-up script as the container entrypoint.

## Usage
To build the api-manager and test images with [`earthly`](https://docs.earthly.dev/):

```sh
earth +image

earth +test-image
```

To run the WSO2 API Manager:

```sh
export API_MANAGER_HOST=apim
export TEST_NETWORK=test

docker network create "$TEST_NETWORK"

docker run -d --name "$API_MANAGER_HOST" \
  --network "$TEST_NETWORK" \
  -p 9443:9443 \
  wso2am:2.1.0-update14

docker run --network "$TEST_NETWORK" \
  --env API_MANAGER_HOST="$API_MANAGER_HOST" \
  wso2am-test
```

To access the web UI:
* Admin console: https://localhost:9443/carbon
* Publisher console: https://localhost:9443/publisher
* API store: https://localhost:9443/store

## License
Refer to the [LICENSE](LICENSE) file. WSO2 license can be found [here](http://wso2.com/licenses).
