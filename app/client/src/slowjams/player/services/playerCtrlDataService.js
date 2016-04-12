'use strict';

var Util = require('../../../../../util/util');

module.exports = function ($q, PlayerModel) {

    return {
        getData: function (playerId) {

            var playerPromise = PlayerModel.get(playerId);
            var gamePlayersForPlayerPromise = PlayerModel.getGamePlayers(playerId);
            var gamePlayersPromise = PlayerModel.getGamePlayers(
                playerId,
                { includeAllRowsForGamesWherePlayerIsGamePlayer: 1 }
            );
            var gameJamPositionsForPlayerPromise = PlayerModel.getGameJamPositions(playerId);
            var gameJamPositionsPromise = PlayerModel.getGameJamPositions(
                playerId,
                { includeAllRowsForGamesWherePlayerIsGamePlayer: 1 }
            );
            var gameJamScoresForPlayerPromise = PlayerModel.getGameJamScores(playerId);
            var gameJamScoresPromise = PlayerModel.getGameJamScores(
                playerId,
                { includeAllRowsForGamesWherePlayerIsGamePlayer: 1 }
            );
            var gamesPromise = PlayerModel.getGames(playerId);
            var jamsPromise = PlayerModel.getJams(
                playerId,
                { includeAllRowsForGamesWherePlayerIsGamePlayer: 1 }
            );

            return $q.all([
                playerPromise,
                gamePlayersForPlayerPromise,
                gamePlayersPromise,
                gameJamPositionsForPlayerPromise,
                gameJamPositionsPromise,
                gameJamScoresForPlayerPromise,
                gameJamScoresPromise,
                gamesPromise,
                jamsPromise
            ])
                .then(Util.qSpread(function (
                    player,
                    gamePlayersForPlayer,
                    gamePlayers,
                    gameJamPositionsForPlayer,
                    gameJamPositions,
                    gameJamScoresForPlayer,
                    gameJamScores,
                    games,
                    jams
                ) {

                    return {
                        player: player,
                        gamePlayersForPlayer: gamePlayersForPlayer,
                        gamePlayers: gamePlayers,
                        gameJamPositionsForPlayer: gameJamPositionsForPlayer,
                        gameJamPositions: gameJamPositions,
                        gameJamScoresForPlayer: gameJamScoresForPlayer,
                        gameJamScores: gameJamScores,
                        games: games,
                        jams: jams
                    };
                }))
                .catch(function (error) {

                    // TODO: handle error
                });
        }
    };
};
