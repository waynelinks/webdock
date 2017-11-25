#!/usr/bin/make -f

BACKEND_IMAGE=damlys/phpdock-backend
BACKEND_BASE_IMAGE=damlys/phpdock-backend-base
FRONTEND_IMAGE=damlys/phpdock-frontend
FRONTEND_NODE_IMAGE=damlys/phpdock-frontend-node

BACKEND_VERSION=$(shell cat ./backend/VERSION)
BACKEND_BASE_VERSION=$(shell cat ./backend_base/VERSION)
FRONTEND_VERSION=$(shell cat ./frontend/VERSION)
FRONTEND_NODE_VERSION=$(shell cat ./frontend_node/VERSION)

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

# $(1) docker image name
# $(2) semver format version
# $(3) docker-compose service name
define release_image
	for tag in $(shell ./bin/explode-semver.sh $(2)); do \
		docker tag ${COMPOSE_PROJECT_NAME}/$(3):current $(1):$$tag && docker push $(1):$$tag \
	; done
	-$(call tag_vcs_commit,$(3),$(2))
endef

default: backend.enter-container
backend.enter-container:
	docker-compose exec backend bash
frontend_node.enter-container:
	docker-compose exec frontend_node bash

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
build-images: backend_base.build-image backend.build-image frontend.build-image frontend_node.build-image
pull-or-build-images: backend_base.pull-or-build-image backend.pull-or-build-image frontend.pull-or-build-image frontend_node.pull-or-build-image
release-images: backend_base.release-image backend.release-image frontend.release-image frontend_node.release-image

backend_base.pull-image:
	$(call pull_image,${BACKEND_BASE_IMAGE},${BACKEND_BASE_VERSION},backend_base)
backend_base.build-image:
	$(call build_image,backend_base)
backend_base.pull-or-build-image:
	$(call pull_or_build_image,${BACKEND_BASE_IMAGE},${BACKEND_BASE_VERSION},backend_base)
backend_base.release-image:
	$(call release_image,${BACKEND_BASE_IMAGE},${BACKEND_BASE_VERSION},backend_base)
backend_base.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,backend_base,${BACKEND_BASE_VERSION})

backend.pull-image:
	$(call pull_image,${BACKEND_IMAGE},${BACKEND_VERSION},backend)
backend.build-image:
	$(call build_image,backend)
backend.pull-or-build-image:
	$(call pull_or_build_image,${BACKEND_IMAGE},${BACKEND_VERSION},backend)
backend.release-image:
	$(call release_image,${BACKEND_IMAGE},${BACKEND_VERSION},backend)
backend.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,backend,${BACKEND_VERSION})
backend.download-codebase-assets.dev:
	docker-compose exec backend sh -c " \
		composer install --no-scripts \
	"
backend.download-codebase-assets.prod:
	docker-compose exec backend sh -c " \
		composer install --no-scripts --no-dev \
	"
backend.build-codebase-assets.dev:
	docker-compose exec backend sh -c " \
		composer install \
	"
backend.build-codebase-assets.prod:
	docker-compose exec backend sh -c " \
		composer install --no-dev \
	"
backend.run-codebase-tests.unit:
	@echo "backend unit tests..."
backend.run-codebase-tests.integration:
	@echo "backend integration tests..."
backend.run-codebase-tests.functional:
	@echo "backend functional tests..."
backend.run-codebase-tests: backend.run-codebase-tests.unit backend.run-codebase-tests.integration backend.run-codebase-tests.functional
backend.install-xdebug:
	docker-compose exec backend sh -c " \
		pecl install xdebug \
		&& docker-php-ext-enable xdebug \
	"
	docker-compose restart backend

frontend.pull-image:
	$(call pull_image,${FRONTEND_IMAGE},${FRONTEND_VERSION},frontend)
frontend.build-image:
	$(call build_image,frontend)
frontend.pull-or-build-image:
	$(call pull_or_build_image,${FRONTEND_IMAGE},${FRONTEND_VERSION},frontend)
frontend.release-image:
	$(call release_image,${FRONTEND_IMAGE},${FRONTEND_VERSION},frontend)
frontend.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,frontend,${FRONTEND_VERSION})
frontend.download-codebase-assets.dev:
	docker-compose exec frontend_node sh -c " \
		npm install --ignore-scripts \
	"
frontend.download-codebase-assets.prod:
	docker-compose exec frontend_node sh -c " \
		npm install --ignore-scripts --production \
	"
frontend.build-codebase-assets.dev:
	docker-compose exec frontend_node sh -c " \
		npm rebuild \
	"
frontend.build-codebase-assets.prod:
	docker-compose exec frontend_node sh -c " \
		npm rebuild \
	"
frontend.run-codebase-tests.unit:
	@echo "frontend unit tests..."
frontend.run-codebase-tests.integration:
	@echo "frontend integration tests..."
frontend.run-codebase-tests.functional:
	@echo "frontend functional tests..."
frontend.run-codebase-tests: frontend.run-codebase-tests.unit frontend.run-codebase-tests.integration frontend.run-codebase-tests.functional

frontend_node.pull-image:
	$(call pull_image,${FRONTEND_NODE_IMAGE},${FRONTEND_NODE_VERSION},frontend_node)
frontend_node.build-image:
	$(call build_image,frontend_node)
frontend_node.pull-or-build-image:
	$(call pull_or_build_image,${FRONTEND_NODE_IMAGE},${FRONTEND_NODE_VERSION},frontend_node)
frontend_node.release-image:
	$(call release_image,${FRONTEND_NODE_IMAGE},${FRONTEND_NODE_VERSION},frontend_node)
frontend_node.tag-commit:
	@./bin/confirm.sh
	$(call tag_vcs_commit,frontend_node,${FRONTEND_NODE_VERSION})

mysql.backup:
	./bin/mysql-create-backup.sh

redis.flush:
	docker-compose exec redis redis-cli -a ${REDIS_PASSWORD} flushdb
