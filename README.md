# Getting Started

Super simple Angular app with 1 module and 2 routes , with support for running protractor tests inside a CentOS 7 container.
Please refer to the readme of the primary project https://github.com/johnpapa/angular-tour-of-heroes

## Build the image
```
docker build -t heroes-builder -f Dockerfile .
```

## Start the container

Runs the container using the image built in the previous step. The image contains Centos7 + Angular dependencies + Protractor dependencies

```
docker run --detach=true --name=heroes-builder  --user=root --cap-add=SYS_ADMIN -t -v $(pwd)/dist:/dist:Z heroes-builder
```

## Execute protractor tests
```
docker exec heroes-builder ./functional_tests.sh
```

## How to use this Dockerfile with other projects.

- Drop the following files into your project directory
  - `Dockerfile`
  - `google-chrome.repo`
  - `gpg/`

- Update your `protractor.conf.js` 
  ```
    capabilities: {
      'browserName': 'chrome',
      'chromeOptions': {
        'args': [ '--no-sandbox']
      }   
    }
    directConnect: false, 
  ```
  
 - Build the image 
 - Run the container
 - Execute the tests.
