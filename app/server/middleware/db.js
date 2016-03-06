'use strict';

var Promise = require('bluebird');

var pgp = require('pg-promise')({
    promiseLib: Promise,
});

var cn = {
    host: process.env.SLOWJAMS_POSTGRES_HOST,
    port: process.env.SLOWJAMS_POSTGRES_PORT,
    database: process.env.SLOWJAMS_POSTGRES_DBNAME,
    user: process.env.SLOWJAMS_POSTGRES_USER,
    password: process.env.SLOWJAMS_POSTGRES_PASSWORD
};

var db = pgp(cn);

module.exports = db;
