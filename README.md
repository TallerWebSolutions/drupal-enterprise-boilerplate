# Drupal Projects Boilerplate
This boilerplate is based on how whe are currently working with Drupal at Taller. It may not be suitable for all kinds of projects and still needs lots of decoupling.

## Dependencies
 - Docker
 - Docker-compose
 - Make

## How to Use

### Installing locally
 - Clone this repository
 - Remove .git folder
 - Now is the moment I suggest you to create your own Git repo and commit the boilerplate code, but it is really up to you
 - Find/replace the following variables (be carefull not to replace in this Readme):

|||
|---|---|
| APP_IMAGE_NAME | The name of the Docker image for your site |
| DB_CONTAINER_NAME | The name of the Docker container with the database |
| CI_ACQUIA_DIR | The name of the folder to use in CI when deploying to Acquia |
| ACQUIA_GIT_DOMAIN | The domain of Acquia's Git repository |
| ACQUIA_GIT_REPO | The Acquia's Git repository of your project |
| GIT_USER_EMAIL | The email to be in the Git config while building in Semaphore and deploying to Acquia |
| GIT_USER_NAME | The name to be in the Git config while building in Semaphore and deploying to Acquia |
| DRUPAL_SITE_NAME | The name of your Drupal site |
| SERVER_ADMIN | Apache server admin |

 - Run `make`
 - If everything went right, you should be able to access your Drupal site in your localhost
 - Commit Drupal generated files

### Coding Standards

#### PHP Code Sniffer
To mantain the [Drupal Coding Standards](https://www.drupal.org/docs/develop/standards) in our custom code, we use the [PHPCS](https://github.com/squizlabs/PHP_CodeSniffer) lib with the [Coder module](https://www.drupal.org/project/coder).

To run it against your project, use the following command from Makefile:
```
make sniff
```
Some errors in the sniffer can be automatically corrected by running:
```
make beautify
```
The remaining errors you'll have to fix by yourself.

### Deploying
Currently, the integration and delivry features of this boilerplate assume you are using Semaphore CI for building and hosting the environments in Acquia Cloud. Add more generic scripts that can be used to build in other CI systems or deploy in other servers is one of the many improvements we need to do.

 - In the setup of the Semaphore project, place the following command:
```
make ci-setup
```
 - In a job of this project, place the following command:
```
make ci-run
```

## Features
 - Ready to use Drupal installation
 - Drush
 - Drupal Console
 - Node (with NVM)
 - Pre configured Acquia deploy scripts

## FYI
 - This boilerplate works best with Drupal ^8.5
 - By default, the latest Drupal 8 version is installed
 - You should always commit your composer.lock file
