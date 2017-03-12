/*
 * <%= name %> v<%= version %>
 * <%= site %>
 *
 * Cssnext integration via https://github.com/rstacruz/iconfonts.
 * Usage:
 *
 *    @apply --<%= prefix %>-font;
 *    .button:before {
 *      @apply --<%= prefix %>-icon;
 *      @apply --<%= prefix %>-icon-arrow;
 *    }
 *
 * Output:
 *
 *    @font-face {
 *      font-family: "<%= name %>"; ...
 *    }
 *    .button:before {
 *      font-family: "<%= name %>";
 *      content: '\f0123';
 *    }
 *
 * Icon files:
 *
 *     <%= urlpath %><%= basename %>.eot
 *     <%= urlpath %><%= basename %>.ttf
 *     <%= urlpath %><%= basename %>.woff
 *     <%= urlpath %><%= basename %>.svg
 */

:root {
  --<%= prefix %>-path: <%= path.replace(/:/g, '\\:') %>;
  --<%= prefix %>-name: <%= name %>;
  --<%= prefix %>-site: <%= site.replace(/:/g, '\\:') %>;
  --<%= prefix %>-basename: <%= basename %>;
  --<%= prefix %>-version: <%= version %>;
  --<%= prefix %>-svghash: <%= svghash %>;
  --<%= prefix %>-nativesize: <%= nativesize %>;

  --<%= prefix %>-font {
    @font-face {
      font-family: var(--<%= prefix %>-name);
      src: url("var(--<%= prefix %>-path)var(--<%= prefix %>-basename).eot?v=var(--<%= prefix %>-version)");
      src: url("var(--<%= prefix %>-path)var(--<%= prefix %>-basename).eot?#iefix&v=var(--<%= prefix %>-version)") format("embedded-opentype"),
           url("var(--<%= prefix %>-path)var(--<%= prefix %>-basename).woff?v=var(--<%= prefix %>-version)") format("woff"),
           url("var(--<%= prefix %>-path)var(--<%= prefix %>-basename).ttf?v=var(--<%= prefix %>-version)") format("truetype"),
           url("var(--<%= prefix %>-path)var(--<%= prefix %>-basename).svg?v=var(--<%= prefix %>-version)var(--<%= prefix %>-svghash)") format("svg");
      font-weight: normal;
      font-style: normal;
    }
  };

  --<%= prefix %>-icon: {
    line-height: 1em;
    font-family: var(--<%= prefix %>-name);
    font-weight: normal;
    font-style: normal;
    display: inline-block;
    text-decoration: none;
    vertical-align: middle;
    -webkit-font-smoothing: antialiased !important;
    -moz-osx-font-smoothing: grayscale;
  };

<% each(function (val, key) { %>
  --<%= prefix %>-icon-<%= key %>: { content: "<%= val %>"; };<% }); %>
}
