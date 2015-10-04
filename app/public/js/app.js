'use strict';

var slowJamsApp = angular.module('slowJamsApp', [
    'ngRoute',
    'slowJamsApp.controllers'
]);

slowJamsApp.config(['$routeProvider',
    function ($routeProvider) {

        $routeProvider.
            when('/games', {
                templateUrl: '/partials/games-list.html',
                controller: 'GamesCtrl as gamesData'
            }).
            otherwise({
                redirectTo: '/games'
            });
    }
]);
