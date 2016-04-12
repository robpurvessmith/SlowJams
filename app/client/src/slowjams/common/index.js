'use strict';

var angular = require('angular');

var common = angular.module('SlowJams.Common', []);

// -- Models

common.factory('PlayerModel', ['$http', require('./models/player')]);

module.exports = common.name;
