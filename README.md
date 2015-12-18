### wso2apim

Docker image to install and run WSO2 API Manager. 

### Tags

* [1.9.1, latest](https://github.com/ihcsim/docker-wso2apim/tree/1.9.1)
* [1.9.1-alpine](https://github.com/ihcsim/docker-wso2apim/tree/1.9.1-alpine) - Experimental with API Manager 1.9.1
* [1.8.0](https://github.com/ihcsim/docker-wso2apim/tree/1.8.0)
* [1.6.0](https://github.com/ihcsim/docker-wso2apim/tree/1.6.0)

### Description

The dockerfile will:
* Use `wget` to pull the APIM 1.9.1 ZIP from a S3 bucket into the container `/opt` folder.
* Install `zip`.
* Unzip the APIM 1.9.1 ZIP.
* Remove the APIM 1.9.1 ZIP.
* Expose the container port `9443`, `9736`, `8243`, `8280`, `10397`, `7711`.
* Set the `wso2server.sh` start-up script as the container entrypoint.

### Usage

* To pull: `docker pull isim/wso2apim`
* To run: `docker run --rm --name your_container_name -p 9443:9443 -p 9736:9736 -p 8243:8243 -p 8280:8280 -p 10397:10397 -p 7711:7711 isim/wso2apim`
* To access the web admin console, navigate to `https://localhost:9443/carbon`
* To access the publisher, navigate to `https://localhost:9443/publisher`
* To access the API store, navigate to `https://localhost:9443/store`
* To pull alpine-based image: `docker pull isim/wso2apim:alpine-java`
* To run alpine-based image: `docker run --rm -h localhost --name your_container_name -p 9443:9443 isim/wso2apim:alpine-java`

Follow me on [![alt text][1.1]][1]
[1.1]: http://i.imgur.com/tXSoThF.png (twitter icon with padding)
[1]: http://www.twitter.com/IvanHCSIM
