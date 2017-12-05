#!/usr/bin/make -f

include bin/functions.mk

API_IMAGE=damlys/phpdock-backend
API_FUNDAMENT_IMAGE=damlys/phpdock-backend-base
SPA_IMAGE=damlys/phpdock-frontend
SPA_NODE_IMAGE=damlys/phpdock-frontend-node

include .env

default: api.enter-container
api.enter-container:
	docker-compose exec api bash
spa_node.enter-container:
	docker-compose exec spa_node bash

up:
	docker-compose up -d
start:
	docker-compose start
stop:
	docker-compose stop
state:
	@echo "\"docker-compose\" command is using \033[44m${COMPOSE_FILE}\033[0m files"
	docker-compose ps
config:
	@echo "\"docker-compose\" command is using \033[44m${COMPOSE_FILE}\033[0m files"
	docker-compose config
pull-images: api_fundament.pull-image api.pull-image spa.pull-image spa_node.pull-image
build-images: api_fundament.build-image api.build-image spa.build-image spa_node.build-image
pull-or-build-images: api_fundament.pull-or-build-image api.pull-or-build-image spa.pull-or-build-image spa_node.pull-or-build-image
release-images: api_fundament.release-image api.release-image spa.release-image spa_node.release-image

api.pull-image:
	$(call pull_image,${API_IMAGE},api)
api.build-image:
	$(call build_image,api)
api.pull-or-build-image:
	$(call pull_or_build_image,${API_IMAGE},api)
api.release-image:
	$(call release_image,api,${API_IMAGE})
api.tag-commit:
	@./bin/confirm.bash
	$(call tag_vcs_commit,api)
api.download-codebase-assets.dev:
	docker-compose exec api sh -c " \
		composer install --no-scripts \
	"
api.download-codebase-assets.prod:
	docker-compose exec api sh -c " \
		composer install --no-scripts --no-dev \
	"
api.build-codebase-assets.dev:
	docker-compose exec api sh -c " \
		composer install \
	"
api.build-codebase-assets.prod:
	docker-compose exec api sh -c " \
		composer install --no-dev \
	"
api.run-codebase-tests.unit:
	@echo "api unit tests..."
api.run-codebase-tests.integration:
	@echo "api integration tests..."
api.run-codebase-tests.functional:
	@echo "api functional tests..."
api.run-codebase-tests: api.run-codebase-tests.unit api.run-codebase-tests.integration api.run-codebase-tests.functional
api.install-xdebug:
	docker-compose exec api docker-entrypoint --install-xdebug
	docker-compose restart api

api_fundament.pull-image:
	$(call pull_image,${API_FUNDAMENT_IMAGE},api_fundament)
api_fundament.build-image:
	$(call build_image,api_fundament)
api_fundament.pull-or-build-image:
	$(call pull_or_build_image,${API_FUNDAMENT_IMAGE},api_fundament)
api_fundament.release-image:
	$(call release_image,api_fundament,${API_FUNDAMENT_IMAGE})
api_fundament.tag-commit:
	@./bin/confirm.bash
	$(call tag_vcs_commit,api_fundament)

spa.pull-image:
	$(call pull_image,${SPA_IMAGE},spa)
spa.build-image:
	$(call build_image,spa)
spa.pull-or-build-image:
	$(call pull_or_build_image,${SPA_IMAGE},spa)
spa.release-image:
	$(call release_image,spa,${SPA_IMAGE})
spa.tag-commit:
	@./bin/confirm.bash
	$(call tag_vcs_commit,spa)
spa.download-codebase-assets.dev:
	docker-compose exec spa_node sh -c " \
		npm install --ignore-scripts \
	"
spa.download-codebase-assets.prod:
	docker-compose exec spa_node sh -c " \
		npm install --ignore-scripts --production \
	"
spa.build-codebase-assets.dev:
	docker-compose exec spa_node sh -c " \
		npm rebuild \
	"
spa.build-codebase-assets.prod:
	docker-compose exec spa_node sh -c " \
		npm rebuild \
	"
spa.run-codebase-tests.unit:
	@echo "spa unit tests..."
spa.run-codebase-tests.integration:
	@echo "spa integration tests..."
spa.run-codebase-tests.functional:
	@echo "spa functional tests..."
spa.run-codebase-tests: spa.run-codebase-tests.unit spa.run-codebase-tests.integration spa.run-codebase-tests.functional

spa_node.pull-image:
	$(call pull_image,${SPA_NODE_IMAGE},spa_node)
spa_node.build-image:
	$(call build_image,spa_node)
spa_node.pull-or-build-image:
	$(call pull_or_build_image,${SPA_NODE_IMAGE},spa_node)
spa_node.release-image:
	$(call release_image,spa_node,${SPA_NODE_IMAGE})
spa_node.tag-commit:
	@./bin/confirm.bash
	$(call tag_vcs_commit,spa_node)

mysql.backup:
	./bin/mysql-create-backup.bash

redis.flush:
	docker-compose exec redis redis-cli -a ${REDIS_PASSWORD} flushdb
