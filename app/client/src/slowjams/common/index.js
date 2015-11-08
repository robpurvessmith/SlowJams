'use strict';

var angular = require('angular');

var common = angular.module('SlowJams.Common', []);

// -- Models

common.factory('BoutsModel', ['$http', require('./models/boutsModel')]);
common.factory('JamsModel', ['$http', require('./models/jamsModel')]);
common.factory('PeriodsModel', ['$http', require('./models/periodsModel')]);

module.exports = common.name;
