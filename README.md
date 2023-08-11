# RealWorld Functional Tests
## Documentation ##
- [Functionality and Test Cases and Bug Mapping](https://app.wisemapping.com/c/maps/1556416/public)
Obs.: Use space bar to collapse and uncollapse tree's branch

## LightHouse Parameter Report ##
In August 11 was generated a lighthouse report to analyse some points of improvement and are they:
- ionicons.min.css from ionicframework.com and main.css from productionready.com causes a high render blocking for the first contentful page. Try to use more performatic CDN to hosting to those static files.

# RealWorld E2E Test Automation
## Abstract ##
We are running a simple implementation of "RCC + Robot FrameWork + BrowserLibrary (PlayWright API) + Pabot" to get tests E2E running at any configuration platform with python pre installed.
* RCC is our virtual environment tool
* Robot Framework is our gherkin interface to write and reuse some important pieces of the tests, variables etc
* BrowserLibrary is a python implementation to use PlayWright API to execute web browser instructions as writen in our tests
* Pabot is a parallelisation tool to run test in a suite and/or test level

## Documentation ##
- [RCC](https://robocorp.com/docs/rcc/overview)
- [RobotFramework](https://robotframework.org/)
    - [Standard and Built-in Libraries](https://robotframework.org/robotframework/#standard-libraries)
    - [BrowserLibrary](https://marketsquare.github.io/robotframework-browser/Browser.html)
- [Pabot](https://docs.robotframework.org/docs/parallel)


## Instalation ##

### RCC ###
You can follow the instructions to install RCC toolchain.
<https://github.com/robocorp/rcc#installing-rcc-from-command-line>

## Running Tests ##
It is important to try to execute all commands at home level of this project.
Obs.: In the first time execute RCC, it will create the virtual environment, download dependecies and libraries as defined at conda.yaml once. So it will be lazy just this time and it will be almost instantaneous for the next runs.

This command line execute task who trigger all tests in local environment
```sh
rcc run --robot robot.yaml --task local 
```

This command line execute task who trigger only smoke tests in local environment
```sh
rcc run --robot robot.yaml --task local-smoke
```

This command line execute task who trigger all tests in dev environment (at URL <https://realworld.svelte.dev>)
```sh
rcc run --robot robot.yaml --task dev
```
This command line execute task who trigger only smoke tests in dev environment (at URL <https://realworld.svelte.dev>)
```sh
rcc run --robot robot.yaml --task dev-smoke
```