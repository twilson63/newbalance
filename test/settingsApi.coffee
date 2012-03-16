newbalance = require '../lib'
request = require 'request'

uri = 'http://localhost:7000/'

describe 'PUT /settings', ->
  it 'heartbeat config', (done) ->
    request.put uri + 'settings',
      json:
        heartbeat:
          interval: 30
          uri: '/'
          status: 200
      (e, r, b) ->
        b.status.should.equal 'success'
        done()

describe 'GET /settings', ->
  it 'heartbeat config', (done) ->
    request.get uri + 'settings', json: true, (e, r, b) ->
      b.heartbeat.should.be.a 'object'
      done()
