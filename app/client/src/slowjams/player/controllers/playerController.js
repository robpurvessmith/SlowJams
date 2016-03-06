'use strict';

var _ = require('lodash');

module.exports = function (data) {

    var playerCtrl = this;

    // -- Private data

    var gameJamPositionsGrouped = _.groupBy(data.gameJamPositions, 'game_id');

    var gameJamScoresForPlayerGrouped = _.groupBy(data.gameJamScoresForPlayer, 'game_id');

    var gameJamScoresGrouped = _.keyBy(data.gameJamScores, function (gameJamScoresForGame) {

        return gameJamScoresForGame[0].game_id;
    });

    var columnDefs = [
        {
            headerName: 'Game',
            field: 'gameId'
        },
        {
            headerName: '# Game Jams',
            field: 'numGameJams'
        },
        {
            headerName: 'Game +/-',
            field: 'gamePlusMinus'
        },
        {
            headerName: '# Player Jams',
            field: 'numPlayerJams'
        },
        {
            headerName: 'Player +/-',
            field: 'playerPlusMinus'
        },
        {
            headerName: 'Contribution',
            field: 'contribution'
        }
    ];

    var rowData = [];

    var gridOptions = {

        // -- Properties

        columnDefs: columnDefs,
        rowData: rowData,
        enableSorting: true,
        enableFilter: true,
        angularCompileHeaders: true,
        angularCompileRows: true,

        // -- Events

        onGridReady: function (e) {

            initTable();
        }

        // -- Callbacks
    };

    // -- Private functions

    // Public API

    playerCtrl.player = data.player;

    playerCtrl.gridOptions = gridOptions;

    // -- Init

    function initTable() {

        _.forEach(data.gamePlayers, function (gamePlayer) {

            var gameId = gamePlayer.game_id;

            var team = gamePlayer.team;

            var playerPlusMinusPartitioned = _.has(gameJamScoresForPlayerGrouped, gameId) ?

                _(gameJamScoresForPlayerGrouped[gameId])
                    .partition(function (gameJamScore) {

                        return gameJamScore.team === team;
                    })
                    .map(function (gameJamScoresForPartition) {

                        return _.sumBy(gameJamScoresForPartition, function (gameJamScore) {

                            return parseInt(gameJamScore.points, 10);
                        });
                    })
                    .value() :
                    [0, 0];

            var playerPlus = playerPlusMinusPartitioned[0];

            var playerMinus = playerPlusMinusPartitioned[1];

            var playerRatio = (playerMinus === 0) ? 1 : playerPlus / playerMinus;

            var numPlayerJams = _.has(gameJamPositionsGrouped, gameId) ?

                // it is possible for a player to have multiple positions in a single jam
                _.uniqBy(gameJamPositionsGrouped[gameId], function (gameJamPosition) {

                    // property order is non-deterministic in objects, so this may fail
                    return JSON.stringify(_.pick(gameJamPosition, ['game_id', 'period', 'jam']));
                }).length :
                0;

            var numGameJams = _.has(gameJamScoresGrouped, gameId) ?

                _.uniqBy(gameJamScoresGrouped[gameId], function (gameJamScore) {

                    // property order is non-deterministic in objects, so this may fail
                    return JSON.stringify(_.pick(gameJamScore, ['game_id', 'period', 'jam']));
                }).length :
                0;

            var jamRatio = (numGameJams === 0) ? 0 : numPlayerJams / numGameJams;

            var gamePlusMinusPartitioned = _.has(gameJamScoresGrouped, gameId) ?

                _(gameJamScoresGrouped[gameId])
                    .partition(function (gameJamScore) {

                        return gameJamScore.team === team;
                    })
                    .map(function (gameJamScoresForPartition) {

                        return _.sumBy(gameJamScoresForPartition, function (gameJamScore) {

                            return parseInt(gameJamScore.points, 10);
                        });
                    })
                    .value() :
                    [0, 0];

            var gamePlus = gamePlusMinusPartitioned[0];

            var gameMinus = gamePlusMinusPartitioned[1];

            var gameRatio = (gameMinus === 0) ? 1 : gamePlus / gameMinus;

            rowData.push({
                gameId: gameId,
                numGameJams: numGameJams,
                gamePlusMinus: gamePlus - gameMinus,
                numPlayerJams: numPlayerJams,
                playerPlusMinus: playerPlus - playerMinus,
                contribution: (playerRatio / gameRatio) * jamRatio
            });

            gridOptions.api.setRowData(rowData);
        });
    }

};
