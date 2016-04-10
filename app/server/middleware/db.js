'use strict';

var Bluebird = require('bluebird');

var pgp = require('pg-promise')({
    promiseLib: Bluebird,
});

var cn = process.env.DATABASE_URL || {
    host: 'localhost',
    port: 5432,
    database: 'slowjams',
    user: '',
    password: ''
};

var db = pgp(cn);

module.exports = db;
