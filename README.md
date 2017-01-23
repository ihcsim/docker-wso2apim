# docker-wso2apim

[ ![Codeship Status for ihcsim/docker-wso2apim](https://app.codeship.com/projects/f9f472e0-c271-0134-3993-22c030d3a647/status?branch=master)](https://app.codeship.com/projects/197444)

Docker image to install and run WSO2 API Manager.

## Tags
* [2.0.0, latest](https://github.com/ihcsim/docker-wso2apim/tree/2.0.0)
* [1.9.1](https://github.com/ihcsim/docker-wso2apim/tree/1.9.1)
* [1.9.1-alpine](https://github.com/ihcsim/docker-wso2apim/tree/1.9.1-alpine) - Experimental with API Manager 1.9.1
* [1.8.0](https://github.com/ihcsim/docker-wso2apim/tree/1.8.0)
* [1.6.0](https://github.com/ihcsim/docker-wso2apim/tree/1.6.0)

## Description
The Dockerfile will:
* Use `wget` to pull the WSO2 API Manager 2.0.0 zip file from a S3 bucket into the container `/opt` folder.
* Install `zip`.
* Unzip the APIM 2.0.0 ZIP.
* Remove the APIM 2.0.0 ZIP.
* Expose the container port `9443`, `9736`, `8243`, `8280`, `10397`, `7711`.
* Set the `wso2server.sh` start-up script as the container entrypoint.

## Usage
To run the WSO2 API Manager:
```sh
$ docker run -d --name apim -p 9443:9443 isim/wso2apim
```

To access the web UI:
* Admin console: https://localhost:9443/carbon
* Publisher console: https://localhost:9443/publisher
* API store: https://localhost:9443/store

## License
Refer to the [LICENSE](LICENSE) file. WSO2 license can be found [here](http://wso2.com/licenses).
