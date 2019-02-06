.PHONY: test
test: bats
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PATH" bats test

.PHONY: test-integration
test-integration:
	@PATH="$$PWD/bats/bin:$$PWD/bin:$$PWD/shims:$$PATH" SWIFTENV_ROOT="$$PWD" bats test/integration

bats:
	git clone --depth 1 https://github.com/sstephenson/bats.git

CACHED_VERSIONS := 3.0 3.0.1 3.0.2 3.1 3.1.1 4.0 4.0.2 4.0.3 4.1 4.1.1 4.1.2 4.1.3 4.2 4.2.1 4.2.2
CACHED_PATHS := $(foreach version,$(CACHED_VERSIONS),share/swiftenv-install/$(version))
versions: $(CACHED_PATHS)

share/swiftenv-install/%:
	@echo Generating $*
	@curl -o $@.json https://swiftenv-api.fuller.li/versions/$*
	@cat $@.json | python -c "import json, sys; p = json.load(sys.stdin)['_links']; p = sorted(['  \'{}\' )\n    URL=\"{}\"\n    ;;\n'.format(p, u['href']) for (p,u) in p.items() if p != 'self']); print('case \"%sPLATFORM\" in') % chr(36); print('\n'.join(p)); print('  * )\n    ;;\nesac')" > $@
