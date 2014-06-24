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

    @import font-awesome
    fa-font()
    
    button:before
      fa-icon("music", 14px)

### Stylus

    @import font-awesome
    fa-font()
    
    button:before
      fa-icon("music", 14px)

### Less

    @import 'font-awesome';
    .fa-font();
    
    button:before {
      .fa-icon("music");
      font-size: 14px;
    }
