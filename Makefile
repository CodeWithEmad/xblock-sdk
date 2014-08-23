#!/usr/bin/make -f

SQLITE_DB=workbench.db

all: install test

.PHONY: install
install: $(SQLITE_DB)
	# TODO: we need to install requirements.txt so XBlock is installed
	# from a GitHub repo.  Once XBlock is available through PyPi,
	# we can install all requirements using setup.py
	pip install -r requirements.txt
	pip install -e .
	pip install -r test-requirements.txt

$(SQLITE_DB):
	python manage.py syncdb

test:
	python manage.py test

cover:
	coverage run manage.py test
	coverage report
