'use strict';

var db = require('../middleware/db');
var _ = require('lodash');

exports.getAll = function () {

    var query = 'SELECT * FROM game_jam_position';

    return db.any(query);
};

exports.getForPlayer = function (playerId) {

    return this.getAll()
        .then(function (data) {

            return _.filter(data, { player_id: playerId });
        })
        .catch(function (error) {

            // TODO: handle error
            console.log(error);
        });
};
