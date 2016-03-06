'use strict';

module.exports = function ($http) {

    return {
        getGameJamScores: function (gameId) {

            return $http.get('/api/v1/games/' + gameId + '/gameJamScores');
        }
    };
};
