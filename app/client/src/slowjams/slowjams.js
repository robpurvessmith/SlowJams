'use strict';

var slowJams = angular.module('SlowJams', [
    'ngRoute',
    'ui.bootstrap',
    'SlowJams.Common',
    'SlowJams.Bout',
    'SlowJams.Player'
]);

slowJams.config(['$routeProvider', function ($routeProvider) {

    $routeProvider
        .when('/bouts', {
            templateUrl: 'src/slowjams/bout/partials/bouts.html',
            controller: 'BoutsCtrl',
            controllerAs: 'bouts',
            resolve: {
                data: function (BoutsCtrlDataService) {

                    return BoutsCtrlDataService.getData();
                }
            }
        })
        .when('/players/:playerId', {
            templateUrl: 'src/slowjams/player/partials/player.html',
            controller: 'PlayerCtrl',
            controllerAs: 'player',
            resolve: {
                data: function ($route, PlayerCtrlDataService) {

                    var playerId = $route.current.params.playerId;

                    return PlayerCtrlDataService.getData(playerId);
                }
            }
        })
        .otherwise({
            redirectTo: '/bouts'
        });
}]);

$(function () {
    angular.bootstrap(document, ['SlowJams']);
});
