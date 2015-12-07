'use strict';

var angular = require('angular');

// ui.bootstrap
require('../../../node_modules/angular-bootstrap/ui-bootstrap-tpls.min.js');

// ag-grid
require('../../../node_modules/ag-grid/dist/ag-grid.min.js');

var slowJams = angular.module('SlowJams', [
    require('angular-route'),
    'ui.bootstrap',
    'agGrid',
    require('./common'),
    require('./bout'),
    require('./player')
]);

slowJams.config(['$routeProvider', function ($routeProvider) {

    $routeProvider
        .when('/bouts', {
            templateUrl: 'src/slowjams/bout/partials/bouts.html',
            controller: 'BoutsCtrl',
            controllerAs: 'bouts',
            resolve: {
                data: ['BoutsCtrlDataService', function (BoutsCtrlDataService) {

                    return BoutsCtrlDataService.getData();
                }]
            }
        })
        .when('/players/:playerId', {
            templateUrl: 'src/slowjams/player/partials/player.html',
            controller: 'PlayerCtrl',
            controllerAs: 'player',
            resolve: {
                data: ['$route', 'PlayerCtrlDataService', function ($route, PlayerCtrlDataService) {

                    var playerId = $route.current.params.playerId;

                    return PlayerCtrlDataService.getData(playerId);
                }]
            }
        })
        .otherwise({
            redirectTo: '/bouts'
        });
}]);

slowJams.controller('MainCtrl', [function () {

    var main = this;
}]);

angular.element(document).ready(function () {

    angular.bootstrap(document, ['SlowJams']);
});
