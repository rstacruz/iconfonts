# Icon fonts

Icon fonts support for Sass, Less and Stylus.

Install
-------

### Manual

Get the files you need over at [/stylesheets/](stylesheets) and put it in your 
project.

### Bower

Using bower makes files available via 
`bower_components/iconfonts/stylesheets/___.sass`.

    bower install iconfonts

### NPM

Using bower makes files available via 
`node_modules/iconfonts/stylesheets/___.sass`.

    npm install iconfonts

Setup
-----

### Sass

``` sass
@import font-awesome

fa-font()

button:before
  fa-icon("music", 14px)
```

See [a Sass file](sytlesheets/ionicons.sass) for more info.

### Stylus

``` sass
@require font-awesome

fa-font()

button:before
  fa-icon("music", 14px)
```

See [a stylus file](sytlesheets/ionicons.styl) for more info.

### Less

``` less
@import 'font-awesome';
.fa-font();

button:before {
  .fa-icon("music");
  font-size: 14px;
}
```

See [a less file](sytlesheets/ionicons.less) for more info.

## Acknowledgements

MIT licensed.
