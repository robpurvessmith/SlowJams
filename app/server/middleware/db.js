'use strict';

var Promise = require('bluebird');

var pgp = require('pg-promise')({
    promiseLib: Promise,
});

var cn = process.env.DATABASE_URL || {
    host: 'localhost',
    port: 5432,
    database: 'slowjams',
    user: 'brandon',
    password: ''
};

var db = pgp(cn);

module.exports = db;
