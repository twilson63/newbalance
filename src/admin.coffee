tako = require 'tako'

#global.list.add host: '127.0.0.1', port: 4000
#global.list.add host: '127.0.0.1', port: 4001

module.exports = ->
  app = tako()

  app.route('/servers/add').json (req, resp) ->
    req.on 'json', (json) -> 
      global.list.add(json)
      resp.end global.list.all()

  app.route('/servers').json (req, resp) ->
    resp.end global.list.all()
  app.route('/servers/clear').json (req, resp) ->
    global.list.clear()
    resp.end global.list.all()
  app.httpServer.listen(7000)
