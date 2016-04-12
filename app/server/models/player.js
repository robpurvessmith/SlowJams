'use strict';

var db = require('../middleware/db');

exports.get = function (playerId) {

    var query =
        'SELECT player.* ' +
        'FROM player ' +
        'WHERE player.player_id = $1';

    return db.oneOrNone(query, playerId);
};
