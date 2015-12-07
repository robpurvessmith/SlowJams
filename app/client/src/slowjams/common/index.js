'use strict';

var angular = require('angular');

var common = angular.module('SlowJams.Common', []);

// -- Models

common.factory('PlayerModel', ['$http', require('./models/player')]);

common.factory('GameModel', ['$http', require('./models/game')]);

module.exports = common.name;
