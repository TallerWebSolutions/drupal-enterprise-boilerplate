SHELL := /bin/bash # Use bash syntax
# Configure environment.
# ----------------------

export TZ=America/Sao_Paulo
export USER_ID=$(shell id -u)

# @TODO Hack for MacOSX or other OS which has the same group id
#       than the containers user.
export GROUP_ID=$(shell if [ `id -g` == '20' ]; then echo '1000'; else echo `id -g`; fi)

APP_CONTAINER=$(shell docker-compose ps | grep _app_run_ | cut -d" " -f 1)

run:
	touch temp/.bash_history
	docker-compose run --service-ports --rm app

in:
	docker exec -it ${APP_CONTAINER} /bin/bash

stop:
	docker-compose stop

clean:
	docker-compose down
	docker rmi APP_IMAGE_NAME

ci-clean:
	docker-compose down

build:
	docker-compose build app

ci-setup:
	./scripts/ci-setup.sh

ci-check:
	./scripts/ci-check.sh

ci-install:
	./scripts/ci-install.sh

ci-tests: sniff
	./scripts/ci-tests.sh

ci-install-prod:
	./scripts/ci-install-prod.sh

ci-deploy:
	./scripts/ci-deploy.sh

sniff:
	./scripts/sniff.sh

beautify:
	./scripts/beautify.sh

xdebug:
	./scripts/toggle-xdebug.sh

backup-local-database:
	docker-compose run --rm app sh ./scripts/backup-local-database.sh

restore-local-database:
	docker-compose run --rm app sh ./scripts/restore-local-database.sh

default: run


## MacOSx only

run-macos:
	touch temp/.bash_history
	docker-compose -f docker-compose.yml -f docker-compose.macos.yml run --service-ports --rm app

sniff-macos:
	docker exec -it ${APP_CONTAINER} ./bin/phpcs ./web/modules/custom ./web/modules/sandbox

beautify-macos:
	docker exec -it ${APP_CONTAINER} ./bin/phpcbf ./web/modules/custom ./web/modules/sandbox
