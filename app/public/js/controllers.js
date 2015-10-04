'use strict';

var slowJamsAppControllers = angular.module('slowJamsApp.controllers', []);

slowJamsAppControllers.controller('GamesCtrl', ['$scope', '$http',
    function ($scope, $http) {

        var gamesData = this;

        gamesData.games = [];

        $http.get('/api/games').success(function (data) {

            gamesData.games = data;
        });
    }
]);