/*
 * tool for parsing CSS.
 */

var _ = require('underscore'),
  css = require('css'),
  out;
  
readStdin(function (e, input) {
  var doc = css.parse(input);

  if (!doc || doc.type !== 'stylesheet')
    throw new Error("not a stylesheet");

  out = extractIcons(doc);
  out = sortKeys(out);

  console.log(JSON.stringify(out, null, 2));
});

function extractIcons (doc) {
  var out = {};

  doc.stylesheet.rules.forEach(function (rule) {
    var
      content   = _(rule.declarations).find(function (d) { return d.property === 'content'; }),
      selectors = rule.selectors;

    if (content && selectors[0].match(/:before$/)) {
      var val = JSON.parse(content.value);
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
