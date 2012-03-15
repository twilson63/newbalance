var flatiron;

flatiron = require('flatiron');

module.exports = function() {
  var app;
  app = flatiron.app;
  app.use(flatiron.plugins.http);
  app.router.get('/servers', function() {
    this.res.writeHead(200, {
      'content-type': 'application/json'
    });
    return this.res.end(JSON.stringify(global.list.all()));
  });
  app.router.post('/servers', function() {
    try {
      if (this.req.headers['content-type'] !== 'application/json') {
        throw new Error('not json');
      }
      if (typeof this.req.body !== 'object') throw new Error('not json');
      global.list.add(this.req.body);
      this.res.writeHead(201, {
        'content-type': 'application/json'
      });
      return this.res.end(JSON.stringify({
        status: 'success'
      }));
    } catch (err) {
      this.res.writeHead(404, {
        'content-type': 'application/json'
      });
      return this.res.end(JSON.stringify({
        error: {
          description: 'could not parse json'
        }
      }));
    }
  });
  app.router["delete"]('/servers', function() {
    global.list.clear();
    this.res.writeHead(200, {
      'content-type': 'application/json'
    });
    return this.res.end(JSON.stringify({
      status: 'success'
    }));
  });
  return app.start(7000);
};
