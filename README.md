# Drupal Projects Boilerplate
This boilerplate is based on how whe are currently working with Drupal at Taller. It may not be suitable for all kinds of projects and still needs lots of decoupling.

## Setting up
 - Clone this repository
 - Remove .git folder
 - Find/replace the following variables:

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

