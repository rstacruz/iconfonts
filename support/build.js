var args = process.argv.slice(2),
  _ = require('underscore'),
  data = require(process.cwd() + '/' + args[0]),
  icons = data.icons,
  template = _.template(require('fs').readFileSync(args[1], 'utf-8'));

data.each = function (fn) {
  for (var key in icons)
    if (icons.hasOwnProperty(key)) fn(icons[key], key);
};

console.log(template(data));
