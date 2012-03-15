var bouncy, http;

bouncy = require('bouncy');

http = require('http');

module.exports = function() {
  return bouncy(function(req, bounce) {
    return bounce(global.list.get());
  }).listen(8000);
};
