#
#	Makefile for Webinar.ru test
#				Last update: 17:38:09 15-Jul-18 Violet *
#
#

ifdef SCALE
XSCALE=$(SCALE)
else
XSCALE=1
endif

ifdef HOSTS
XHOSTS=$(HOSTS)
else
XHOSTS="wbackend"
endif

all:	deploy

deploy:	test.yml
	rm -f instances.txt
	ansible-playbook test.yml --extra-vars "hst=$(XHOSTS)"
	docker ps --filter 'name=wbackend' --format '{{ .ID }} {{ .Ports }}' | sed 's/[:-]/ /g' | awk '{ printf "%s %s\n", $$1, $$3 }' > instances.txt
	rm -f test.yml

run:	instances
	php run.php

instances:
	@docker ps --filter 'name=wbackend' --format '{{ .ID }} {{ .Ports }}' | sed 's/[:-]/ /g' | awk '{ printf "%s %s\n", $$1, $$3 }' > instances.txt

test.yml:	test.yml.template
	sed s/XXXSCALEXXX/$(XSCALE)/ < test.yml.template > test.yml

clean:
	rm -f test.yml
	docker ps --filter 'name=wbackend' --format '{{ .ID }}' | xargs docker kill

kill:
	docker ps --filter 'name=wbackend' --format '{{ .ID }}' | xargs docker kill

help:
	@echo "Usage:"
	@echo "   deploy N containers onto hosts HOSTS:"
	@echo "\tmake [SCALE=N] [HOSTS=list]"
	@echo "   stop all running containers:"
	@echo "\tmake clean"
	@echo "   run test routine (PHP script):"
	@echo "\tmake run"

vars:

.DEFAULT:	all

u:
	/usr/local/bin/git add Makefile *.yml *.sh wtest/*.yml ansible.cfg wtest/Dockerfile wtest/sql/*
	( /usr/local/bin/git commit || echo "ok" )
	/usr/local/bin/git push -u

.PHONY:	instances all
