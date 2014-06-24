/* jshint evil: true */

/*
 * tool for parsing CSS.
 *
 *     node support/cssparse.js < hello.css
 */

var _ = require('underscore'),
  css = require('css'),
  out;
  
readStdin(function (e, input) {
  var doc = css.parse(input);

  if (!doc || doc.type !== 'stylesheet')
    throw new Error("not a stylesheet");

  out = {};
  out.name = extractName(doc);
  out.icons = extractIcons(doc);
  out.icons = sortKeys(out.icons);

  console.log(JSON.stringify(out, null, 2));
});

function extractName (doc) {
  var fontface = _(doc.stylesheet.rules).find(function (r) { return r.type === 'font-face'; });
  if (!fontface) return;

  var fontfamily = _(fontface.declarations).find(function (d) { return d.type === 'declaration'; });
  if (!fontfamily) return;

  return stringparse(fontfamily.value);
}

function extractIcons (doc) {
  var out = {};

  doc.stylesheet.rules.forEach(function (rule) {
    var
      content   = _(rule.declarations).find(function (d) { return d.property === 'content'; }),
      selectors = rule.selectors;

    if (content && selectors[0].match(/:before$/)) {
      var val = stringparse(content.value);
      selectors.forEach(function (sel) {
        sel = sel.replace(/^\.[a-z]+-(.*):before$/, '$1');
        out[sel] = val;
      });
    }
  });

  return out;
}

function sortKeys (obj) {
  var keys = Object.keys(obj).sort();
  var out = {};
  keys.forEach(function (key) { out[key] = obj[key]; });
  return out;
}

function readStdin(fn) {
  process.stdin.resume(); /* paused by default */
  process.stdin.setEncoding('utf8');

  var data = '';
  process.stdin.on('data', function(chunk) { data += chunk.toString(); });
  process.stdin.on('end', function() { fn(null, data); });
}

function stringparse (str) {
  try {
    if (str.match(/^'.*'$/) || str.match(/^".*"$/))
      return eval(str);
  } catch (e) { }
  return str;
}
