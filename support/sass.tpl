/*
  <%= name %> v<%= version %>
  <%= site %>
  Usage:

     @include <%= prefix %>-font;
     .button:before {
       @include <%= prefix %>-icon("arrow");
       @include <%= prefix %>-icon("arrow", 14px, #333);
     }

  Output:

     @font-face {
       font-family: "<%= name %>"; ...
     }
     .button:before {
       font-family: "<%= name %>";
       content: '\f0123';
     }

  Icon files:

      http<%= path %><%= basename %>.eot
      http<%= path %><%= basename %>.ttf
      http<%= path %><%= basename %>.woff
      http<%= path %><%= basename %>.svg
 */

$<%= prefix %>-path: "<%= path %>"
$<%= prefix %>-name: "<%= name %>"
$<%= prefix %>-site: "<%= site %>"
$<%= prefix %>-basename: "<%= basename %>"
$<%= prefix %>-version: "<%= version %>"
$<%= prefix %>-svghash: "<%= svghash %>"
$<%= prefix %>-nativesize: "<%= nativesize %>"

= <%= prefix %>-font
  @font-face
    font-family: $<%= prefix %>-name
    src: url($<%= prefix %>-path + $<%= prefix %>-basename + '.eot?v=' + $<%= prefix %>-version)
    src: url($<%= prefix %>-path + $<%= prefix %>-basename + '.eot?#iefix&v=' + $<%= prefix %>-version) format("embedded-opentype"), url($<%= prefix %>-path + $<%= prefix %>-basename + ".woff?v=" + $<%= prefix %>-version) format("woff"), url($<%= prefix %>-path + $<%= prefix %>-basename + ".ttf?v=" + $<%= prefix %>-version) format("truetype"), url($<%= prefix %>-path + $<%= prefix %>-basename + ".svg?v=" + $<%= prefix %>-version + $<%= prefix %>-svghash) format("svg")
    font-weight: normal
    font-style: normal

/*
 * Uses a given icon.
 *
 *     .button:before
 *       +<%= prefix %>-icon(music)
 *       +<%= prefix %>-icon(music, 24px)        /* 24px size */
 *
 * You may specify a color.
 *
 *     .button:before
 *       +<%= prefix %>-icon(music, $color: #333)
 *
 * You may also specify a `$top` value to compensate for any mis-alignment.
 * This nudges the icon by that many pixels from the top.
 *
 *     .button:before
 *       +<%= prefix %>-icon(music, $top: 2px)
 */

= <%= prefix %>-icon(type, $size = auto, $color = auto, $top = auto, $left = auto, $shadow = none)
  @extend %<%= prefix %>-icon
  content: $<%= prefix %>-icon-{type}

  unless size is "auto"
    font-size: $size
  unless top is "auto"
    position: relative
    top: $top
  unless left is "auto"
    position: relative
    left: $left
  unless color is "auto"
    color: $color
  unless shadow is "none"
    text-shadow: $shadow

%<%= prefix %>-icon
  line-height: 1em
  font-family: $<%= prefix %>-name
  font-weight: normal
  font-style: normal
  display: inline-block
  text-decoration: none
  vertical-align: middle
  text-rendering: optimizeLegibility !important
  -webkit-font-smoothing: antialiased !important
  -moz-osx-font-smoothing: grayscale

<% each(function (val, key) { %>
$<%= prefix %>-icon-<%= key %>: "<%= val %>";<% }); %>
