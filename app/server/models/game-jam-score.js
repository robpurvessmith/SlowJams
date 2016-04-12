'use strict';

var db = require('../middleware/db');

exports.getForPlayer = function (playerId) {

    var query =
        'SELECT game_jam_score.* ' +
        'FROM game_jam_score ' +
        'WHERE (game_jam_score.game_id, game_jam_score.period, game_jam_score.jam) IN (' +
            'SELECT game_id, period, jam ' +
            'FROM game_jam_position ' +
            'WHERE game_jam_position.player_id = $1' +
        ')';

    return db.any(query, playerId);
};

exports.getForGamesWherePlayerIsGamePlayer = function (playerId) {

    var query =
        'SELECT game_jam_score.* ' +
        'FROM game_jam_score ' +
        'WHERE game_jam_score.game_id IN (' +
            'SELECT game_id ' +
            'FROM game_player ' +
            'WHERE game_player.player_id = $1' +
        ')';

    return db.any(query, playerId);
};
