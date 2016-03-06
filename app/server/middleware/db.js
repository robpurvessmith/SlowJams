'use strict';

var Promise = require('bluebird');

var pgp = require('pg-promise')({
    promiseLib: Promise,
});

// TODO: use environment variables for config values
var cn = {
    host: 'localhost',
    port: 5432,
    database: 'slowjams',
    user: '',
    password: ''
};

var db = pgp(cn);

module.exports = db;
