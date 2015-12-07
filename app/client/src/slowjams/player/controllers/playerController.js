'use strict';

var _ = require('lodash');

module.exports = function (data) {

    var player = this;

    // -- Private data

    var gameJamPositionsGrouped = _.groupBy(data.gameJamPositions, 'GameId');

    var gameJamScoresForPlayerGrouped = _.groupBy(data.gameJamScoresForPlayer, 'GameId');

    var gameJamScoresGrouped = _.indexBy(data.gameJamScores, function (gameJamScoresForGame) {

        return gameJamScoresForGame[0].GameId;
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

        onReady: function (e) {

            initTable();
        }

        // -- Callbacks
    };

    // -- Private functions


    // Public API

    player.player = data.player;

    player.gridOptions = gridOptions;

    // -- Init

    function initTable() {

        _.forEach(data.gamePlayers, function (gamePlayer) {

            var gameId = gamePlayer.GameId;

            var team = gamePlayer.Team;

            var playerPlusMinusPartitioned = _.has(gameJamScoresForPlayerGrouped, gameId) ?

                _(gameJamScoresForPlayerGrouped[gameId])
                    .partition(function (gameJamScore) {

                        return gameJamScore.Team === team;
                    })
                    .map(function (gameJamScoresForPartition) {

                        return _.sum(gameJamScoresForPartition, function (gameJamScore) {

                            return parseInt(gameJamScore.Points, 10);
                        });
                    })
                    .value() :
                    [0, 0];

            var playerPlus = playerPlusMinusPartitioned[0];

            var playerMinus = playerPlusMinusPartitioned[1];

            var playerRatio = (playerMinus === 0) ? 1 : playerPlus / playerMinus;

            var numPlayerJams = _.has(gameJamPositionsGrouped, gameId) ?

                // it is possible for a player to have multiple positions in a single jam
                _.uniq(gameJamPositionsGrouped[gameId], function (gameJamPosition) {

                    // property order is non-deterministic in objects, so this may fail
                    return JSON.stringify(_.pick(gameJamPosition, ['GameId', 'Period', 'Jam']));
                }).length :
                0;

            var numGameJams = _.has(gameJamScoresGrouped, gameId) ?

                _.uniq(gameJamScoresGrouped[gameId], function (gameJamScore) {

                    // property order is non-deterministic in objects, so this may fail
                    return JSON.stringify(_.pick(gameJamScore, ['GameId', 'Period', 'Jam']));
                }).length :
                0;

            var jamRatio = (numGameJams === 0) ? 0 : numPlayerJams / numGameJams;

            var gamePlusMinusPartitioned = _.has(gameJamScoresGrouped, gameId) ?

                _(gameJamScoresGrouped[gameId])
                    .partition(function (gameJamScore) {

                        return gameJamScore.Team === team;
                    })
                    .map(function (gameJamScoresForPartition) {

                        return _.sum(gameJamScoresForPartition, function (gameJamScore) {

                            return parseInt(gameJamScore.Points, 10);
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
