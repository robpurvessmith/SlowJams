'use strict';

var _ = require('lodash');

var Player = require('../models/player');
var GamePlayer = require('../models/game-player');
var GameJamPosition = require('../models/game-jam-position');
var GameJamScore = require('../models/game-jam-score');

exports.player = {
    get: function (req, res, next) {

        var playerId = req.params.playerId;

        var player = Player.get(playerId);

        res.send(player);
    },
    getGamePlayers: function (req, res, next) {

        var playerId = req.params.playerId;

        var gamePlayersForPlayer = GamePlayer.getForPlayer(playerId);

        res.send(gamePlayersForPlayer);
    },
    getGameJamPositions: function (req, res, next) {

        var playerId = req.params.playerId;

        var gameJamPositionsForPlayer = GameJamPosition.getForPlayer(playerId);

        res.send(gameJamPositionsForPlayer);
    },
    getGameJamScores: function (req, res, next) {

        var playerId = req.params.playerId;

        var gameJamScoresForPlayer = GameJamScore.getForPlayer(playerId);

        res.send(gameJamScoresForPlayer);
    }
};

exports.game = {
    getGameJamScores: function (req, res, next) {

        var gameId = req.params.gameId;

        var gameJamScoresForGame = GameJamScore.getForGame(gameId);

        res.send(gameJamScoresForGame);
    }
}
