'use strict';

var _ = require('lodash');

var Player = require('../models/player');
var GamePlayer = require('../models/game-player');
var GameJamPosition = require('../models/game-jam-position');
var GameJamScore = require('../models/game-jam-score');
var Game = require('../models/game');

exports.player = {
    get: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        return Player.get(playerId)
            .then(function (player) {

                res.send(player);
            });
    },
    getGamePlayers: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        return GamePlayer.getForPlayer(playerId)
            .then(function (gamePlayersForPlayer) {
                res.send(gamePlayersForPlayer);
            });
    },
    getGameJamPositions: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        return GameJamPosition.getForPlayer(playerId)
            .then(function (gameJamPositionsForPlayer) {

                res.send(gameJamPositionsForPlayer);
            });
    },
    getGameJamScores: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        return GameJamScore.getForPlayer(playerId)
            .then(function (gameJamScoresForPlayer) {

                res.send(gameJamScoresForPlayer);
            });
    },
    getGames: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        return Game.getForPlayer(playerId)
            .then(function (gamesForPlayer) {

                res.send(gamesForPlayer);
            });
    }
};

exports.game = {
    getGameJamScores: function (req, res, next) {

        var gameId = parseInt(req.params.gameId);

        return GameJamScore.getForGame(gameId)
            .then(function (gameJamScoresForGame) {

                res.send(gameJamScoresForGame);
            });
    }
}
