#!/usr/bin/make -f

BACKEND_VERSION=$(shell cat ./backend/VERSION)
FRONTEND_VERSION=$(shell cat ./frontend/VERSION)

include .env

# $(1) docker-compose service name
# $(2) semver format version
define tag_commit
	git tag $(1)-$(2)
	git push origin $(1)-$(2)
endef

# $(1) docker image name
# $(2) semver format version
define pull_image
	docker pull $(1):$(2)
	docker tag $(1):$(2) $(1):current
endef

# $(1) docker-compose service name
define build_image
	docker-compose build --no-cache $(1)
endef

# $(1) docker image name
# $(2) semver format version
define release_image
	for tag in $(shell ./bin/explode-semver.sh $(2)); do docker tag $(1):current $(1):$$tag; done
	for tag in $(shell ./bin/explode-semver.sh $(2)); do docker push $(1):$$tag; done
endef

default: backend.enter-container
backend.enter-container:
	docker-compose exec backend bash
frontend.enter-container:
	docker-compose exec frontend bash
node.enter-container:
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
tag-commit: backend.tag-commit frontend.tag-commit
pull-images: backend.pull-image frontend.pull-image
build-all-images: backend.build-base-image frontend.build-node-image build-images
build-images: backend.build-image frontend.build-image
release-images: backend.release-image frontend.release-image
download-codebase-assets.dev: backend.download-codebase-assets.dev frontend.download-codebase-assets.dev
download-codebase-assets.prod: backend.download-codebase-assets.prod frontend.download-codebase-assets.prod
build-codebase-assets.dev: backend.build-codebase-assets.dev frontend.build-codebase-assets.dev
build-codebase-assets.prod: backend.build-codebase-assets.prod frontend.build-codebase-assets.prod
run-codebase-tests: backend.run-codebase-tests frontend.run-codebase-tests

backend.tag-commit:
	@./bin/confirm.sh
	$(call tag_commit,backend,${BACKEND_VERSION})
backend.pull-image:
	$(call pull_image,${BACKEND_IMAGE},${BACKEND_VERSION})
backend.build-base-image:
	$(call build_image,backend_base)
backend.build-image:
	$(call build_image,backend)
backend.release-image:
	$(call release_image,${BACKEND_IMAGE},${BACKEND_VERSION})
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
backend.run-codebase-tests: backend.run-codebase-tests.unit backend.run-codebase-tests.integration backend.run-codebase-tests.functional
backend.run-codebase-tests.unit:
	@echo "backend unit tests..."
backend.run-codebase-tests.integration:
	@echo "backend integration tests..."
backend.run-codebase-tests.functional:
	@echo "backend functional tests..."
backend.install-xdebug:
	docker-compose exec backend sh -c " \
		pecl install xdebug \
		&& docker-php-ext-enable xdebug \
	"
	docker-compose restart backend

frontend.tag-commit:
	@./bin/confirm.sh
	$(call tag_commit,frontend,${FRONTEND_VERSION})
frontend.pull-image:
	$(call pull_image,${FRONTEND_IMAGE},${FRONTEND_VERSION})
frontend.build-image:
	$(call build_image,frontend)
frontend.build-node-image:
	$(call build_image,frontend_node)
frontend.release-image:
	$(call release_image,${FRONTEND_IMAGE},${FRONTEND_VERSION})
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
frontend.run-codebase-tests: frontend.run-codebase-tests.unit frontend.run-codebase-tests.integration frontend.run-codebase-tests.functional
frontend.run-codebase-tests.unit:
	@echo "frontent unit tests..."
frontend.run-codebase-tests.integration:
	@echo "frontent integration tests..."
frontend.run-codebase-tests.functional:
	@echo "frontent functional tests..."

mysql.backup:
	./bin/mysql-create-backup.sh

redis.flush:
	docker-compose exec redis redis-cli -a ${REDIS_PASSWORD} flushdb
