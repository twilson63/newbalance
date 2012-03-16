flatiron = require 'flatiron'

module.exports = ->
  app = flatiron.app
  app.use flatiron.plugins.http
  app.router.get '/settings', ->
    @res.writeHead 200, 'content-type': 'application/json'
    @res.end JSON.stringify(global.settings)
  app.router.put '/settings', ->
    global.settings = @req.body
    @res.writeHead 200, 'content-type': 'application/json'
    @res.end JSON.stringify(status: 'success')
  app.router.get '/servers', ->
    @res.writeHead 200, 'content-type': 'application/json'
    @res.end JSON.stringify(global.list.all())
  app.router.post '/servers', ->
    try
      unless @req.headers['content-type'] is 'application/json' then throw new Error('not json')
      unless typeof @req.body is 'object' then throw new Error('not json')
      global.list.add(@req.body)
      @res.writeHead 201, 'content-type': 'application/json'
      @res.end JSON.stringify(status: 'success')
    catch err
      @res.writeHead 404, 'content-type': 'application/json'
      @res.end JSON.stringify(error: { description: 'could not parse json' })
  app.router.delete '/servers', ->
    global.list.clear()
    @res.writeHead 200, 'content-type': 'application/json'
    @res.end JSON.stringify(status: 'success')
  app.start 7000
