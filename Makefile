.PHONY: test

test: bats
	@PATH="./bats/bin:$$PATH" bats test

bats:
	git clone --depth 1 https://github.com/sstephenson/bats.git
