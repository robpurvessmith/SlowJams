'use strict';

var db = require('../middleware/db');

exports.getForPlayer = function (playerId) {

    var query =
        'SELECT game_player.* ' +
        'FROM game_player ' +
        'WHERE game_player.player_id = $1';

    return db.any(query, playerId);
};

exports.getForGamesWherePlayerIsGamePlayer = function (playerId) {

    var query =
        'SELECT game_player.* ' +
        'FROM game_player ' +
        'WHERE game_player.game_id IN (' +
            'SELECT game_id ' +
            'FROM game_player ' +
            'WHERE game_player.player_id = $1' +
        ')';

    return db.any(query, playerId);
};
