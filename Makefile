.PHONY: test
test: bats
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PATH" bats test

.PHONY: test-integration
test-integration:
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PWD/shims:$$PATH" SWIFTENV_ROOT="$$PWD" bats test/integration

bats:
	git clone --depth 1 https://github.com/sstephenson/bats.git
