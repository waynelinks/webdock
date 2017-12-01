#!/usr/bin/make -f

API_VERSION=$(shell cat ./api/VERSION)
API_FUNDAMENT_VERSION=$(shell cat ./api_fundament/VERSION)
SPA_VERSION=$(shell cat ./spa/VERSION)
SPA_NODE_VERSION=$(shell cat ./spa_node/VERSION)

API_IMAGE=damlys/phpdock-backend
API_FUNDAMENT_IMAGE=damlys/phpdock-backend-base
SPA_IMAGE=damlys/phpdock-frontend
SPA_NODE_IMAGE=damlys/phpdock-frontend-node

include .env

# $(1) docker image name
# $(2) semver format version
# $(3) docker-compose service name
define pull_image
	docker pull $(1):$(2) && docker tag $(1):$(2) ${COMPOSE_PROJECT_NAME}/$(3):current
endef

# $(1) docker-compose service name
define build_image
	docker-compose build --no-cache $(1)
endef

# $(1) docker image name
# $(2) semver format version
# $(3) docker-compose service name
define pull_or_build_image
	$(call pull_image,$(1),$(2),$(3)) || $(call build_image,$(3))
endef

# $(1) docker-compose service name
# $(2) semver format version
define tag_vcs_commit
	git tag $(1)-$(2) && git push origin $(1)-$(2)
endef

# $(1) docker-compose service name
# $(2) semver format version
# $(3) docker image name
define release_image
	for tag in $(shell ./bin/explode-semver.sh $(2)); do \
		docker tag ${COMPOSE_PROJECT_NAME}/$(1):current $(3):$$tag && docker push $(3):$$tag \
	; done
	$(call tag_vcs_commit,$(1),$(2))
endef

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
build-images: api_fundament.build-image api.build-image spa.build-image spa_node.build-image
pull-or-build-images: api_fundament.pull-or-build-image api.pull-or-build-image spa.pull-or-build-image spa_node.pull-or-build-image
release-images: api_fundament.release-image api.release-image spa.release-image spa_node.release-image

api.pull-image:
	$(call pull_image,${API_IMAGE},${API_VERSION},api)
api.build-image:
	$(call build_image,api)
api.pull-or-build-image:
	$(call pull_or_build_image,${API_IMAGE},${API_VERSION},api)
api.release-image:
	$(call release_image,api,${API_VERSION},${API_IMAGE})
api.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,api,${API_VERSION})
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
	docker-compose exec api sh -c " \
		pecl install xdebug \
		&& docker-php-ext-enable xdebug \
	"
	docker-compose restart api

api_fundament.pull-image:
	$(call pull_image,${API_FUNDAMENT_IMAGE},${API_FUNDAMENT_VERSION},api_fundament)
api_fundament.build-image:
	$(call build_image,api_fundament)
api_fundament.pull-or-build-image:
	$(call pull_or_build_image,${API_FUNDAMENT_IMAGE},${API_FUNDAMENT_VERSION},api_fundament)
api_fundament.release-image:
	$(call release_image,api_fundament,${API_FUNDAMENT_VERSION},${API_FUNDAMENT_IMAGE})
api_fundament.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,api_fundament,${API_FUNDAMENT_VERSION})

spa.pull-image:
	$(call pull_image,${SPA_IMAGE},${SPA_VERSION},spa)
spa.build-image:
	$(call build_image,spa)
spa.pull-or-build-image:
	$(call pull_or_build_image,${SPA_IMAGE},${SPA_VERSION},spa)
spa.release-image:
	$(call release_image,spa,${SPA_VERSION},${SPA_IMAGE})
spa.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,spa,${SPA_VERSION})
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
	$(call pull_image,${SPA_NODE_IMAGE},${SPA_NODE_VERSION},spa_node)
spa_node.build-image:
	$(call build_image,spa_node)
spa_node.pull-or-build-image:
	$(call pull_or_build_image,${SPA_NODE_IMAGE},${SPA_NODE_VERSION},spa_node)
spa_node.release-image:
	$(call release_image,spa_node,${SPA_NODE_VERSION},${SPA_NODE_IMAGE})
spa_node.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,spa_node,${SPA_NODE_VERSION})

mysql.backup:
	./bin/mysql-create-backup.sh

redis.flush:
	docker-compose exec redis redis-cli -a ${REDIS_PASSWORD} flushdb
