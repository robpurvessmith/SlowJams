'use strict';

var _ = require('lodash');

exports.getAll = function () {

    return require('../test-data/dbo.GameJamPosition.json');
};

exports.getForPlayer = function (playerId) {

    return _.filter(this.getAll(), { PlayerId: playerId });
}
