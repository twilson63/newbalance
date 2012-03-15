bouncy = require 'bouncy'
http = require 'http'

module.exports = ->
  bouncy( (req, bounce) -> 
    bounce global.list.get() 
  ).listen(8000)


#  server = http.createServer (req, resp) ->
#    resp.writeHead 200, 'Content-Type': 'text/plain'
#    resp.end 'foo'
#  server.listen(4000)

#  server2 = http.createServer (req, resp) ->
#    resp.writeHead 200, 'Content-Type': 'text/plain'
#    resp.end 'bar'
#  server2.listen(4001)
