'use strict';

var express = require('express');
var router = express.Router();
var ApiController = require('../controllers/api');

router.get('/bouts', ApiController.bouts);

router.get('/jams', ApiController.jams);

router.get('/periods', ApiController.periods);

module.exports = router;
