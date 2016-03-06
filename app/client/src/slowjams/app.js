'use strict';

var angular = require('angular');
require('angular-foundation');
var agGrid = require('ag-grid');

// get ag-Grid to create an Angular module and register the ag-Grid directive
agGrid.initialiseAgGridWithAngular1(angular);

var slowJams = angular.module('SlowJams', [
    require('angular-route'),
    'mm.foundation',
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
            controllerAs: 'boutsCtrl',
            resolve: {
                data: ['BoutsCtrlDataService', function (BoutsCtrlDataService) {

                    return BoutsCtrlDataService.getData();
                }]
            }
        })
        .when('/players/:playerId', {
            templateUrl: 'src/slowjams/player/partials/player.html',
            controller: 'PlayerCtrl',
            controllerAs: 'playerCtrl',
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
