# Uses targets from https://github.com/dokku/dokku
PROGRAM := ship
SYSTEM := $(shell sh -c 'uname -s 2>/dev/null')

.install-bats:
ifneq ($(shell bats --version >/dev/null 2>&1 ; echo $$?),0)
ifeq ($(SYSTEM),Darwin)
	brew install bats-core
else
	git clone https://github.com/josegonzalez/bats-core.git /tmp/bats
	cd /tmp/bats && sudo ./install.sh /usr/local
	rm -rf /tmp/bats
endif
endif

.install-shellcheck:
ifneq ($(shell shellcheck --version >/dev/null 2>&1 ; echo $$?),0)
ifeq ($(SYSTEM),Darwin)
	brew install shellcheck
else
	sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse'
	sudo rm -rf /var/lib/apt/lists/* && sudo apt-get clean
	sudo apt-get update -qq && sudo apt-get install -qq -y shellcheck
endif
endif

.PHONY: test
test: .install-bats
	bats test/

.PHONY: lint
lint: .install-shellcheck
	shellcheck $(PROGRAM)

