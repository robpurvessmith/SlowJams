'use strict';

var _ = require('lodash');

exports.bouts = function(req, res, next) {

    var bouts = require('../models/bouts.json');

    res.send(bouts);
}

exports.periods = function (req, res, next) {

    var periods = require('../models/periods.json');

    res.send(periods);
}

exports.jams = function (req, res, next) {

    var jams = require('../models/jams.json');

    res.send(jams);
}
