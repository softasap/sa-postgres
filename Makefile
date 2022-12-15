init-local:
	PIPENV_NO_INHERIT=True  pipenv --python=$(shell conda run -n py39 which python) --no-site-package
lint-sarif:
	ansible-lint -f sarif > result.sarif

update-from-requirements:
	pipenv install -r ./molecule/requirements-dev.txt

molecule-docker-centos7:
	ansible-galaxy collection install community.docker
	MOLECULE_DISTRO=centos7 MOLECULE_TEST_ROLE=$(notdir $(CURDIR)) molecule converge -s docker

molecule-docker-fedora33:
	ansible-galaxy collection install community.docker
	MOLECULE_DISTRO=fedora33 MOLECULE_TEST_ROLE=$(notdir $(CURDIR)) molecule converge -s docker

molecule-docker-xenial:
	ansible-galaxy collection install community.docker
	MOLECULE_DISTRO=ubuntu1604 MOLECULE_TEST_ROLE=$(notdir $(CURDIR)) molecule converge -s docker

molecule-docker-beaver:
	ansible-galaxy collection install community.docker
	MOLECULE_DISTRO=ubuntu1804 MOLECULE_TEST_ROLE=$(notdir $(CURDIR)) molecule converge -s docker

molecule-docker-focal:
	ansible-galaxy collection install community.docker
	MOLECULE_DISTRO=ubuntu2004 MOLECULE_TEST_ROLE=$(notdir $(CURDIR)) molecule converge -s docker

molecule-docker-jammy:
	ansible-galaxy collection install community.docker
	MOLECULE_DISTRO=ubuntu2204 MOLECULE_TEST_ROLE=$(notdir $(CURDIR)) molecule converge -s docker
