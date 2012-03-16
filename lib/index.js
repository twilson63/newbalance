var admin, balancer;

global.list = require('stop-n-go');

global.settings = {};

admin = require('./admin');

balancer = require('./balancer');

admin();

balancer();

console.log('running...');
