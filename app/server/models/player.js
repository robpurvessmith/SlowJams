'use strict';

var db = require('../middleware/db');
var _ = require('lodash');

exports.getAll = function () {

    var query = 'SELECT * FROM player';

    return db.any(query);
};

exports.get = function (playerId) {

    return this.getAll()
        .then(function (data) {

            var allPlayers = _.keyBy(data, 'player_id');

            return _.get(allPlayers, playerId, null);
        })
        .catch(function (error) {

            // TODO: handle error
            console.log(error);
        });
}
