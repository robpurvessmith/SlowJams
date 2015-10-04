var express = require('express');
var router = express.Router();
var ApiController = require('../controllers/api');

router.get('/games', ApiController.games);

module.exports = router;