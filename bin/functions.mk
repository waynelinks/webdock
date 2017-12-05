# $(1) docker-compose service name
# returns: semver format version
define get_service_version
$(shell cat ./$(1)/VERSION)
endef

# $(1) docker image name
# $(2) docker-compose service name
define pull_image
	docker pull $(1):$(call get_service_version,$(2)) \
	&& docker tag $(1):$(call get_service_version,$(2)) ${COMPOSE_PROJECT_NAME}/$(2):current
endef

# $(1) docker-compose service name
define build_image
	docker-compose build --no-cache $(1)
endef

# $(1) docker image name
# $(2) docker-compose service name
define pull_or_build_image
	$(call pull_image,$(1),$(2)) || $(call build_image,$(2))
endef

# $(1) docker-compose service name
# $(2) docker image name
define release_image
	for tag in $(shell ./bin/explode-semver.bash $(call get_service_version,$(1))); do \
		docker tag ${COMPOSE_PROJECT_NAME}/$(1):current $(2):$$tag && docker push $(2):$$tag \
	; done
endef

# $(1) docker-compose service name
define tag_vcs_commit
	git tag $(1)-$(call get_service_version,$(1)) \
	&& git push origin $(1)-$(call get_service_version,$(1))
endef
