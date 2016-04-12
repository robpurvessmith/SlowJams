'use strict';

module.exports = function ($http) {

    return {
        get: function (playerId) {

            return $http.get('/api/v1/players/' + playerId);
        },
        getGamePlayers: function (playerId, params) {

            params = params || {};

            return $http.get(
                '/api/v1/players/' + playerId + '/gamePlayers',
                { params: params }
            );
        },
        getGameJamPositions: function (playerId, params) {

            params = params || {};

            return $http.get(
                '/api/v1/players/' + playerId + '/gameJamPositions',
                { params: params }
            );
        },
        getGameJamScores: function (playerId, params) {

            params = params || {};

            return $http.get(
                '/api/v1/players/' + playerId + '/gameJamScores',
                { params: params }
            );
        },
        getGames: function (playerId) {

            return $http.get('/api/v1/players/' + playerId + '/games');
        },
        getJams: function (playerId, params) {

            params = params || {};

            return $http.get(
                '/api/v1/players/' + playerId + '/jams',
                { params: params }
            );
        }
    };
};
