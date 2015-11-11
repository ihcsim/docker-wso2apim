### wso2apim

Docker image to install and run WSO2 API Manager. 

The dockerfile will:
* Use `wget` to pull the APIM 1.9.1 ZIP from a S3 bucket into the container `/opt` folder.
* Install `zip`.
* Unzip the APIM 1.9.1 ZIP.
* Remove the APIM1.9.1 ZIP.
* Expose the container port `9443`.
* Set the API Manager `wso2server.sh` start-up script as the container start-up command.

### Tags
* [apim-1.9.1, latest](https://github.com/ihcsim/docker-wso2apim/tree/apim-1.9.1)
* [apim-1.8.0](https://github.com/ihcsim/docker-wso2apim/tree/apim-1.8.0)
* [apim-1.6.0](https://github.com/ihcsim/docker-wso2apim/tree/apim-1.6.0)

### Usage
* To pull: `docker pull isim/wso2apim`
* To run: `docker run --rm --name your_container_name -p 9443:9443 isim/wso2apim`
* To access API Manager web admin console, navigate to `https://localhost:9443`

Follow me on [![alt text][1.1]][1]
[1.1]: http://i.imgur.com/tXSoThF.png (twitter icon with padding)
[1]: http://www.twitter.com/IvanHCSIM
