'use strict';

var db = require('../middleware/db');
var Promise = require('bluebird');

var _ = require('lodash');

var GameJamPosition = require('./game-jam-position');

exports.getAll = function () {

    var query = 'SELECT * FROM game_jam_score';

    return db.any(query);
};

exports.getForPlayer = function (playerId) {

    return Promise.all([
        GameJamPosition.getForPlayer(playerId),
        this.getAll()
    ])
        .spread(function (gameJamPositionsForPlayer, gameJamScores) {

            var jamsForPlayer = _.map(
                gameJamPositionsForPlayer,
                function (gameJamPosition) {

                    return _.pick(gameJamPosition, ['game_id', 'period', 'jam']);
                }
            );

            return _.filter(gameJamScores, function (gameJamScore) {

                return _.find(jamsForPlayer, _.pick(gameJamScore, ['game_id', 'period', 'jam']));
            });
        })
        .catch(function (error) {

            // TODO: handle error
            console.log(error);
        });

};

exports.getForGame = function (gameId) {

    return this.getAll()
        .then(function (data) {

            return _.filter(data, { game_id: gameId });
        });
};
