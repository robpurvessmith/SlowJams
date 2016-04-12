'use strict';

var angular = require('angular');

var player = angular.module('SlowJams.Player', [
    require('../common')
]);

// -- Controllers

player.controller('PlayerCtrl', ['data', require('./controllers/playerController')]);

// -- Services

player.factory('PlayerCtrlDataService', [
    '$q', 'PlayerModel', require('./services/playerCtrlDataService')
]);

module.exports = player.name;
