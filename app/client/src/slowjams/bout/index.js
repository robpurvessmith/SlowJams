'use strict';

var angular = require('angular');

var bout = angular.module('SlowJams.Bout', [
    require('../common')
]);

// -- Controllers

bout.controller('BoutsCtrl', ['data', require('./controllers/boutsController')]);

// -- Services

bout.factory('BoutsCtrlDataService', [
    '$q', 'BoutsModel', require('./services/boutsCtrlDataService')
]);

module.exports = bout.name;
