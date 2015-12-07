'use strict';

var _ = require('lodash');

exports.getAll = function () {

    return require('../test-data/dbo.Player.json');
};

exports.get = function (playerId) {

    var allPlayers = _.indexBy(this.getAll(), 'PlayerId');

    return _.get(allPlayers, playerId, null);
}
