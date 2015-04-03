docker-wso2apim
===================

Docker image to install and run WSO2 API Manager. It uses the [dockerfile/java](https://index.docker.io/u/dockerfile/java/) as its base image.

If you find this helpful, feel free to endorse me on [coderwall](https://coderwal.com/ivanhcsim). [![endorse](https://api.coderwall.com/ivanhcsim/endorsecount.png)](https://coderwall.com/ivanhcsim)

The dockerfile will:

* Use `wget` to pull the APIM 1.6.0 ZIP from a S3 bucket into the container `/opt` folder.
* Install `zip`.
* Unzip the APIM 1.6.0 ZIP.
* Remove the APIM1.6.0 ZIP.
* Expose the container port `9443`.
* Set the API Manager `wso2server.sh` start-up script as the container start-up command.

### Usage
* To pull: `docker pull isim/wso2apim`
* To build: `docker build --rm -t your_image_name github.com/ihcsim/docker-wso2apim`
* To run: `docker run --rm --name your_container_name -p 9443:9443 your_image_name`
* To access API Manager web admin console, navigate to `https://localhost:9443`

Follow me on [![alt text][1.1]][1]
[1.1]: http://i.imgur.com/tXSoThF.png (twitter icon with padding)
[1]: http://www.twitter.com/IvanHCSIM
