global.list = require 'stop-n-go'
admin = require './admin'
balancer = require './balancer'

admin()
balancer()
console.log 'running...'
