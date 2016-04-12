'use strict';

var db = require('../middleware/db');

exports.getForPlayer = function (playerId) {

    var query =
        'SELECT game.* ' +
        'FROM game_player ' +
        'LEFT JOIN game USING (game_id) ' +
        'WHERE game_player.player_id = $1';

    return db.any(query, playerId);
};
