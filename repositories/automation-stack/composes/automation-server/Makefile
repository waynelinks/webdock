#!/usr/bin/env make

default: logs

prepare-host:
	sudo mkdir --parents /var/jenkins/master/workspace/
	sudo mkdir --parents /var/jenkins/slave/workspace/
	sudo chown --recursive 1000:1000 /var/jenkins/master/
	sudo chown --recursive 10000:10000 /var/jenkins/slave/
	@echo "Your Docker GID is: \e[42m$(shell getent group docker | cut -d':' -f3)\e[0m"
setup:
	docker-compose up -d --build --remove-orphans
start:
	docker-compose start
stop:
	docker-compose stop
state:
	docker-compose ps
logs:
	docker-compose logs --timestamps --tail 25 --follow

run-implementation-tests:
	docker-compose exec jenkins_master bash -c "docker run --rm hello-world | grep 'Hello'"
	docker-compose exec jenkins_slave bash -c "docker run --rm hello-world | grep 'Hello'"

jenkins-master-shell:
	docker-compose exec --user root jenkins_master bash
jenkins-slave-shell:
	docker-compose exec --user root jenkins_slave bash
