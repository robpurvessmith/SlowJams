'use strict';

var _ = require('lodash');
var moment = require('moment');
var accounting = require('accounting');

module.exports = function (data) {

    var playerCtrl = this;

    // -- Private data

    var gameJamPositionsGrouped = _.groupBy(data.gameJamPositions, 'game_id');

    var gameJamScoresForPlayerGrouped = _.groupBy(data.gameJamScoresForPlayer, 'game_id');

    var gameJamScoresGrouped = _.keyBy(data.gameJamScores, function (gameJamScoresForGame) {

        return gameJamScoresForGame[0].game_id;
    });

    var gamesIndexed = _.keyBy(data.games, 'game_id');

    // sort by date asc
    var gamePlayersSorted = _.sortBy(data.gamePlayers, function (gamePlayer) {

        return (_.has(gamesIndexed, gamePlayer.game_id)) ?
            moment(gamesIndexed[gamePlayer.game_id].game_date_time).unix() :
            Date.now();
    });

    var columnDefs = [
        {
            headerName: 'Date',
            field: 'date',
            suppressMenu: true,
            pinned: 'left',
            cellRenderer: function (params) {

                if (params.node.floating) {
                    return '<strong>' + params.value + '</strong>';
                }

                return params.value;
            }
        },
        {
            headerName: 'Game',
            field: 'game',
            pinned: 'left',
            cellRenderer: function (params) {

                if (params.value === null) {
                    return '-';
                }

                return params.value;
            }
        },
        {
            headerName: '# Game Jams',
            field: 'numGameJams',
            suppressMenu: true
        },
        {
            headerName: 'Game +/-',
            field: 'gamePlusMinus',
            suppressMenu: true,
            cellRenderer: condtionalColorCellRenderer
        },
        {
            headerName: '# Player Jams',
            field: 'numPlayerJams',
            suppressMenu: true
        },
        {
            headerName: 'Player +/-',
            field: 'playerPlusMinus',
            suppressMenu: true,
            cellRenderer: condtionalColorCellRenderer
        },
        {
            headerName: 'Contribution #1',
            field: 'contribution1',
            suppressMenu: true,
            cellRenderer: function (params) {

                if (params.value === null) {
                    return '-';
                }

                return formatNumber(params.value);
            }
        },
        {
            headerName: 'Contribution #2',
            field: 'contribution2',
            suppressMenu: true,
            cellRenderer: function (params) {

                if (params.value === null) {
                    return '-';
                }

                return formatNumber(params.value);
            }
        }
    ];

    var rowData = [];

    var gridOptions = {

        // -- Properties

        columnDefs: columnDefs,
        rowData: [],
        floatingBottomRowData: [],
        enableColResize: true,
        enableSorting: true,
        enableFilter: true,
        angularCompileHeaders: true,
        angularCompileRows: true,

        // -- Events

        onGridReady: function (e) {

            initTable();
        },
        onModelUpdated: function (e) {

            var totalGames = 0;

            var totalNumGameJams = 0;

            var totalGamePlusMinus = 0;

            var totalNumPlayerJams = 0;

            var totalPlayerPlusMinus = 0;

            var sumProductNumPlayerJamsContribution1 = 0;

            var sumProductNumPlayerJamsContribution2 = 0;

            gridOptions.api.forEachNodeAfterFilter(function (row) {

                totalGames++;

                totalNumGameJams += row.data.numGameJams;

                totalGamePlusMinus += row.data.gamePlusMinus;

                totalNumPlayerJams += row.data.numPlayerJams;

                totalPlayerPlusMinus += row.data.playerPlusMinus;

                sumProductNumPlayerJamsContribution1 += row.data.numPlayerJams * row.data.contribution1;

                sumProductNumPlayerJamsContribution2 += row.data.numPlayerJams * row.data.contribution2;
            });

            var totalRow = {
                date: 'Total',
                game: totalGames,
                numGameJams: totalNumGameJams,
                gamePlusMinus: totalGamePlusMinus,
                numPlayerJams: totalNumPlayerJams,
                playerPlusMinus: totalPlayerPlusMinus,
                contribution1: null,
                contribution2: null
            };

            // contribution #1 and #2 are weighted avgs based on the num player jams
            var avgRow = {
                date: 'Average',
                game: null,
                numGameJams: (totalGames === 0) ? 0 : totalNumGameJams / totalGames,
                gamePlusMinus: (totalGames === 0) ? 0 : totalGamePlusMinus / totalGames,
                numPlayerJams:  (totalGames === 0) ? 0 :totalNumPlayerJams / totalGames,
                playerPlusMinus: (totalGames === 0) ? 0 : totalPlayerPlusMinus / totalGames,
                contribution1: (totalNumPlayerJams === 0) ?
                    0 :
                    sumProductNumPlayerJamsContribution1 / totalNumPlayerJams,
                contribution2: (totalNumPlayerJams === 0) ?
                    0 :
                    sumProductNumPlayerJamsContribution2 / totalNumPlayerJams
            };

            playerCtrl.player.potential1 =
                (sumProductNumPlayerJamsContribution1 / totalNumPlayerJams) /
                (totalNumPlayerJams / totalNumGameJams);

            playerCtrl.player.potential2 =
                (sumProductNumPlayerJamsContribution2 / totalNumPlayerJams) /
                (totalNumPlayerJams / totalNumGameJams);

            playerCtrl.numGamesAfterFilter = totalGames;

            var floatingBottomRowData = [totalRow, avgRow];

            gridOptions.api.setFloatingBottomRowData(floatingBottomRowData);
        }

        // -- Callbacks
    };

    // -- Private functions

    function formatNumber(value) {

        return accounting.formatNumber(value, 2)
            .replace(/\.00$/, '');
    }

    function formatPercent(value) {

        return accounting.formatNumber(value * 100, 2)
            .replace(/\.00$/, '') + '%';
    }

    function condtionalColorCellRenderer(params) {

        var colorClass = '';

        if (params.value > 0) {
            colorClass = 'mod-green';
        } else if (params.value < 0) {
            colorClass = 'mod-red';
        }

        return '<span class="' + colorClass + '">' + params.value + '</span>';
    }

    // Public API

    playerCtrl.player = data.player;

    // set the player's number to the number used in the player's most recent game played
    playerCtrl.player.number = (gamePlayersSorted.length) ?
        _.last(gamePlayersSorted).number :
        '';

    playerCtrl.gridOptions = gridOptions;

    playerCtrl.getPotential1DisplayValue = function () {

        return formatPercent(playerCtrl.player.potential1);
    };

    playerCtrl.getPotential2DisplayValue = function () {

        return formatPercent(playerCtrl.player.potential2);
    };

    // -- Init

    function initTable() {

        _.forEach(gamePlayersSorted, function (gamePlayer) {

            var gameId = gamePlayer.game_id;

            var game = 'Info not available';
            var date = 'Info not available';
            var strengthRatio = 1;

            if (_.has(gamesIndexed, gameId)) {

                game = gamesIndexed[gameId].league_away + ' (' + gamesIndexed[gameId].team_away +
                        ') @ ' + gamesIndexed[gameId].league_home + ' (' +
                        gamesIndexed[gameId].team_home + ')';

                date = moment(gamesIndexed[gameId].game_date_time).format('MMM Do, YYYY');

                if (gamesIndexed[gameId].team_home_avg_points !== 0 &&
                    gamesIndexed[gameId].team_away_avg_points !== 0) {

                    // assumes the player plays for the home team
                    strengthRatio = gamesIndexed[gameId].team_away_avg_points /
                            gamesIndexed[gameId].team_home_avg_points;

                    // player does not play for the home team?
                    if (gamesIndexed[gameId].team_home !== gamePlayer.team) {

                        // yes...use the reciprocal
                        strengthRatio = 1 / strengthRatio;
                    }
                }
            }

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

            var contribution1 = (playerRatio / gameRatio) * jamRatio;

            var contribution2 = contribution1 * strengthRatio;

            rowData.push({
                date: date,
                game: game,
                numGameJams: numGameJams,
                gamePlusMinus: gamePlus - gameMinus,
                numPlayerJams: numPlayerJams,
                playerPlusMinus: playerPlus - playerMinus,
                contribution1: contribution1,
                contribution2: contribution2
            });
        });

        playerCtrl.numGames = rowData.length;

        gridOptions.api.setRowData(rowData);
    }

};
