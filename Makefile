.PHONY: test

test: bats
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PATH" bats test

bats:
	git clone --depth 1 https://github.com/sstephenson/bats.git
