.PHONY: all

all: .installed.cfg

py3/bin/buildout: py3/bin/pip3 requirements.txt constraints.txt
	./py3/bin/pip3 uninstall -y setuptools
	./py3/bin/pip3 install -IUr requirements.txt -c constraints.txt

py3/bin/pip3:
	python3 -m venv py3

custom.cfg:
	[ -e custom.cfg ] || touch custom.cfg

.installed.cfg: py3/bin/buildout buildout.cfg custom.cfg
	./py3/bin/buildout
