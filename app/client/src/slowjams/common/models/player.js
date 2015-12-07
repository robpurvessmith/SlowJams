'use strict';

module.exports = function ($http) {

    return {
        get: function (playerId) {

            return $http.get('/api/v1/players/' + playerId);
        },
        getGamePlayers: function (playerId) {

            return $http.get('/api/v1/players/' + playerId + '/gamePlayers');
        },
        getGameJamPositions: function (playerId) {

            return $http.get('/api/v1/players/' + playerId + '/gameJamPositions');
        },
        getGameJamScores: function (playerId) {

            return $http.get('/api/v1/players/' + playerId + '/gameJamScores');
        }
    };
};
