srcfiles = $(wildcard src/*.json)
stylfiles = $(patsubst src/%.json, stylesheets/%.styl, ${srcfiles})
sassfiles = $(patsubst src/%.json, stylesheets/%.sass, ${srcfiles})

all: ${stylfiles} ${sassfiles}

stylesheets/%.styl: src/%.json
	@echo + $@
	@node support/build.js "$<" support/stylus.tpl > $@

stylesheets,/%.sass: src/%.json
	@echo + $@
	@node support/build.js "$<" support/sass.tpl > $@
