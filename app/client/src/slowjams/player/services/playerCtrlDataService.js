'use strict';

var _ = require('lodash');

module.exports = function ($q, PlayerModel, GameModel) {

    return {
        getData: function (playerId) {

            var playerPromise = PlayerModel.get(playerId);
            var gamePlayersPromise = PlayerModel.getGamePlayers(playerId);
            var gameJamPositionsPromise = PlayerModel.getGameJamPositions(playerId);
            var gameJamScoresPromise = PlayerModel.getGameJamScores(playerId);
            var gamesPromise = PlayerModel.getGames(playerId);

            return $q.all([
                playerPromise,
                gamePlayersPromise,
                gameJamPositionsPromise,
                gameJamScoresPromise,
                gamesPromise
            ])
                .then(function (results) {

                    var player = results[0].data;
                    var gamePlayers = results[1].data;
                    var gameJamPositions = results[2].data;
                    var gameJamScoresForPlayer = results[3].data;
                    var games = results[4].data;

                    // TODO: use query params to do this in 1 query
                    return $q.all(_.map(gamePlayers, function (gamePlayer) {

                        return GameModel.getGameJamScores(gamePlayer.game_id);
                    }))
                        .then(function (results) {

                            return {
                                player: player,
                                gamePlayers: gamePlayers,
                                gameJamPositions: gameJamPositions,
                                gameJamScoresForPlayer: gameJamScoresForPlayer,
                                games: games,
                                gameJamScores: _.map(results, 'data')
                            };
                        })
                        .catch(function (error) {

                            // TODO: handle error
                        });
                })
                .catch(function (error) {

                    // TODO: handle error
                });
        }
    };
};
