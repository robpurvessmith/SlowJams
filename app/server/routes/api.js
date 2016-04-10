'use strict';

var express = require('express');
var router = express.Router();
var ApiController = require('../controllers/api');

router.get('/players/:playerId', ApiController.player.get);

router.get('/players/:playerId/gamePlayers', ApiController.player.getGamePlayers);

router.get('/players/:playerId/gameJamPositions', ApiController.player.getGameJamPositions);

router.get('/players/:playerId/gameJamScores', ApiController.player.getGameJamScores);

router.get('/players/:playerId/games', ApiController.player.getGames);

router.get('/games/:gameId/gameJamScores', ApiController.game.getGameJamScores);

module.exports = router;
