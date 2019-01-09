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
| GIT_USER_EMAIL | The email to be in the Git config while deploying to Acquia |
| GIT_USER_NAME | The name to be in the Git config while deploying to Acquia |
| DRUPAL_SITE_NAME | The name of your Drupal site |
| SERVER_ADMIN | Apache server admin |

 - Run `make`
 - If everything went right, you should be able to access your Drupal site in your localhost
 - Commit Drupal generated files

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
