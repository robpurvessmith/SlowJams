'use strict';

var db = require('../middleware/db');
var _ = require('lodash');

exports.getAll = function () {

    var query = 'SELECT * FROM game';

    return db.any(query);
};

exports.getForPlayer = function (playerId) {

    var query =
        'SELECT game.* ' +
        'FROM game_player ' +
        'LEFT JOIN game USING (game_id) ' +
        'WHERE game_player.player_id = $1';

    return db.any(query, playerId);
}