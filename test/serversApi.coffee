newbalance = require '../lib'
request = require 'request'
# start server

uri = 'http://localhost:7000/servers'

describe 'GET /servers', ->
  it 'should be empty', (done) ->
    global.list.clear()
    request uri, json: true, (e, r, b) ->
      b.length.should.equal 0
      done()

describe 'POST /servers', ->
  it 'should add node', (done) ->
    global.list.clear()
    request.post uri, 
      json: { host: '127.0.0.1', port: 4000}
      (e, r, b) -> 
        b.status.should.equal 'success'
        done()
  it 'should return error', (done) ->
    global.list.clear()
    request.post uri, body: 'foo', (e, r, b) -> 
      JSON.parse(b).error.description.should.equal 'could not parse json'
      done()
describe 'DELETE /servers', ->
  it 'should remove all', (done) ->
    global.list.clear()
    global.list.add host: '127.0.0.1', port: 4000
    request.del uri, json: true, (e, r, b) ->
      b.status.should.equal 'success'
      done()
