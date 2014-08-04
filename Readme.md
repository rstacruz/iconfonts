# Icon fonts

Fine-tuned icon fonts integration for Sass, Less and Stylus.

Featuring the following icon sets:

 * [Elusive](http://shoestrap.org/downloads/elusive-icons-webfont/)
 * [FontAwesome](http://fontawesome.io)
 * [Ionicons](http://ionicons.com)
 * [Foundation Icons General](http://zurb.com/playground/foundation-icon-fonts-3)

Install
-------

### Manual

Get the files you need over at [/stylesheets/](stylesheets) and put it in your 
project.

### Bower

Using bower makes files available via `bower_components/iconfonts/stylesheets/`.

    $ bower install iconfonts

In your less/sass/styl files:

    @include '../bower_components/iconfonts/stylesheets/ionicons';

### NPM

Using npm makes files available via `node_modules/iconfonts/stylesheets/`.

    npm install iconfonts

In your less/sass/styl files:

    @include '../node_modules/iconfonts/stylesheets/ionicons';

Why is it needed?
-----------------

This lets you use CSS definitions only for the icons you need, on the elements
that you need them.

The CSS files that these fonts provide usually give you a lot of cruft, and 
defines all the classes in one giant file.

```
/* CSS */
.fa-user:before { content: '\f007'; }
.fa-film:before { content: '\f008'; }
.fa-th-large:before { content: '\f009'; }
... and 300 more

/* HTML */
<button class="btn btn-plus"><i class="fa fa-plus"></i> Add user</button>
```

I prefer to not have them in my CSS files unless I need them. This project lets 
you do that.

```
/* Stylus */
.btn-plus {
  &:before { fa-icon: "plus"; margin-right: 10px; }
}

/* HTML */
<button class="btn-plus">Add user</button>
```

Setup
-----

#### SCSS ([example](stylesheets/ionicons.scss))

``` scss
@import 'font-awesome';

/* embeds the @font-face. use this only once. */
@include fa-font();

button:before {
  @include fa-icon("music", 14px);
}
```

See [a Sass file](stylesheets/ionicons.scss) for more info.

#### SCSS on Rails

If you're on Rails (with [sass-rails]) and prefer to keep the files in your 
project, download the font files to `vendor/assets/images/`. Afterwards, use
`xx-font-rails()` instead of `xx-font()` to embed the @font-face.  Usage is 
otherwise the same as above.

``` scss
@import 'font-awesome';
@include fa-font-rails();
```

#### Stylus ([example](stylesheets/ionicons.styl))

``` sass
@require font-awesome

fa-font()

button:before
  fa-icon("music", 14px)
```

See [a stylus file](stylesheets/ionicons.styl) for more info.

#### Less ([example](stylesheets/ionicons.less))

``` less
@import 'font-awesome';
.fa-font();

button:before {
  .fa-icon("music");
  font-size: 14px;
}
```

See [a less file](stylesheets/ionicons.less) for more info.

#### Less on Rails

If you're on Rails (with [less-rails]) and prefer to keep the files in your 
project, download the font files to `vendor/assets/images/`. Afterwards, use
`xx-font-rails()` instead of `xx-font()` to embed the @font-face.  Usage is 
otherwise the same as above.

``` scss
@import 'font-awesome';
.fa-font-rails();
```

[sass-rails]: https://github.com/rails/sass-rails
[less-rails]: https://github.com/metaskills/less-rails

## Thanks

**Iconfonts** © 2014+, Rico Sta. Cruz. Released under the [MIT License].<br>
Authored and maintained by Rico Sta. Cruz with help from [contributors].

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[MIT License]: http://mit-license.org/
[contributors]: http://github.com/rstacruz/iconfonts/contributors

[![Status](https://travis-ci.org/rstacruz/iconfonts.svg?branch=master)](https://travis-ci.org/rstacruz/iconfonts)
[![npm version](https://img.shields.io/npm/v/iconfonts.png)](https://npmjs.org/package/iconfonts "View this project on npm")
