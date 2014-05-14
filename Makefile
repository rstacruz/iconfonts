all: \
	css/ionicons.styl

css/%.styl: src/%.json
	node support/build.js "$<" support/stylus.tpl > $@
