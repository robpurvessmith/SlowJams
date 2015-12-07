'use strict';

var _ = require('lodash');

var GameJamPosition = require('./game-jam-position');

exports.getAll = function () {

    return require('../../../Sample\ Data/dbo.GameJamScore.json');
};

exports.getForPlayer = function (playerId) {

    var jamsForPlayer = _.map(
        GameJamPosition.getForPlayer(playerId),
        function (gameJamPosition) {

            return _.pick(gameJamPosition, ['GameId', 'Period', 'Jam']);
        }
    );

    return _.filter(this.getAll(), function (gameJamScore) {

        return _.find(jamsForPlayer, _.pick(gameJamScore, ['GameId', 'Period', 'Jam']));
    });
};

exports.getForGame = function (gameId) {

    return _.filter(this.getAll(), { GameId: gameId });
};
