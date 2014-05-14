srcfiles = $(wildcard src/*.json)
stylfiles = $(patsubst src/%.json, css/%.styl, ${srcfiles})
sassfiles = $(patsubst src/%.json, css/%.sass, ${srcfiles})

all: ${stylfiles} ${sassfiles}

css/%.styl: src/%.json
	@echo + $@
	@node support/build.js "$<" support/stylus.tpl > $@

css/%.sass: src/%.json
	@echo + $@
	@node support/build.js "$<" support/sass.tpl > $@
