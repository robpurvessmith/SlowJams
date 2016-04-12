'use strict';

var _ = require('lodash');

var Player = require('../models/player');
var GamePlayer = require('../models/game-player');
var GameJamPosition = require('../models/game-jam-position');
var GameJamScore = require('../models/game-jam-score');
var Game = require('../models/game');
var Jam = require('../models/jam');

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

        var gamePlayersPromise = (_.has(
            req.query,
            'includeAllRowsForGamesWherePlayerIsGamePlayer'
        )) ?
            GamePlayer.getForGamesWherePlayerIsGamePlayer(playerId) :
            GamePlayer.getForPlayer(playerId);

        return gamePlayersPromise
            .then(function (gamePlayers) {

                res.send(gamePlayers);
            });
    },
    getGameJamPositions: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        var gameJamPositionsPromise = (_.has(
            req.query,
            'includeAllRowsForGamesWherePlayerIsGamePlayer'
        )) ?
            GameJamPosition.getForGamesWherePlayerIsGamePlayer(playerId) :
            GameJamPosition.getForPlayer(playerId);

        return gameJamPositionsPromise
            .then(function (gameJamPositions) {

                res.send(gameJamPositions);
            });
    },
    getGameJamScores: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        var gameJamScoresPromise = (_.has(
            req.query,
            'includeAllRowsForGamesWherePlayerIsGamePlayer'
        )) ?
            GameJamScore.getForGamesWherePlayerIsGamePlayer(playerId) :
            GameJamScore.getForPlayer(playerId);

        return gameJamScoresPromise
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
    },
    getJams: function (req, res, next) {

        var playerId = parseInt(req.params.playerId);

        var jamsPromise = (_.has(
            req.query,
            'includeAllRowsForGamesWherePlayerIsGamePlayer'
        )) ?
            Jam.getForGamesWherePlayerIsGamePlayer(playerId) :
            Jam.getForPlayer(playerId);

        return jamsPromise
            .then(function (jams) {

                res.send(jams);
            });
    },
};
