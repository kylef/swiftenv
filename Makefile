.PHONY: test
test: bats
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PATH" bats test

.PHONY: test-integration
test-integration:
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PWD/shims:$$PATH" SWIFTENV_ROOT="$$PWD" bats test/integration

PHONY: test-build
test-build:
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PWD/shims:$$PATH" SWIFTENV_ROOT="$$PWD" bats test/build

bats:
	git clone --depth 1 https://github.com/sstephenson/bats.git
