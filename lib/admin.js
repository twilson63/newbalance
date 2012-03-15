var tako;

tako = require('tako');

module.exports = function() {
  var app;
  app = tako();
  app.route('/servers/add').json(function(req, resp) {
    return req.on('json', function(json) {
      global.list.add(json);
      return resp.end(global.list.all());
    });
  });
  app.route('/servers').json(function(req, resp) {
    return resp.end(global.list.all());
  });
  app.route('/servers/clear').json(function(req, resp) {
    global.list.clear();
    return resp.end(global.list.all());
  });
  return app.httpServer.listen(7000);
};
