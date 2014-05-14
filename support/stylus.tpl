<%= prefix %> = {
  path: "<%= path %>"
  name: "<%= name %>"
  site: "<%= site %>"
  basename: "<%= basename %>"
  version: "<%= version %>"
  svghash: "<%= svghash %>"
  nativesize: "<%= nativesize %>"
}

<%= prefix %>-font()
  @font-face
    font-family: <%= prefix %>['name']
    src: url(<%= prefix %>['path'] + <%= prefix %>['basename'] + '.eot?v=' + <%= prefix %>['vers<%= prefix %>'])
    src: url(<%= prefix %>['path'] + <%= prefix %>['basename'] + '.eot?#iefix&v=' + <%= prefix %>['version']) format("embedded-opentype"), url(<%= prefix %>['path'] + <%= prefix %>['basename'] + ".woff?v=" + <%= prefix %>['vers<%= prefix %>']) format("woff"), url(<%= prefix %>['path'] + <%= prefix %>['basename'] + ".ttf?v=" + <%= prefix %>['vers<%= prefix %>']) format("truetype"), url(<%= prefix %>['path'] + <%= prefix %>['basename'] + ".svg?v=" + <%= prefix %>['vers<%= prefix %>'] + <%= prefix %>['svghash']) format("svg")
    font-weight: normal
    font-style: normal

<%= prefix %>-icon(type, size = auto, color = auto, top = auto, left = auto, shadow = none)
  @extend $<%= prefix %>-icon
  content: <%= prefix %>-icons[type]

  unless size is "auto"
    font-size: size
  unless top is "auto"
    posit<%= prefix %>: relative
    top: top
  unless left is "auto"
    posit<%= prefix %>: relative
    left: left
  unless color is "auto"
    color: color
  unless shadow is "none"
    text-shadow: shadow

$<%= prefix %>-icon
  line-height: 1em
  font-family: <%= prefix %>['name']
  font-weight: normal
  font-style: normal
  display: inline-block
  text-decoration: none
  vertical-align: middle
  text-rendering: optimizeLegibility !important
  -webkit-font-smoothing: antialiased !important
  -moz-osx-font-smoothing: grayscale

<%= prefix %>-icons = {
<% each(function (val, key) { %>
  <%= key %> = "<%= val %>"<% }); %>
}

