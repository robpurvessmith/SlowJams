'use strict';

var _ = require('lodash');
var moment = require('moment');
var accounting = require('accounting');
var Util = require('../../../../../util/util');

module.exports = function (data) {

    var playerCtrl = this;

    // -- Private data

    // game_jam_position rows where player_id === player.player_id
    var gameJamPositionsForPlayerGroupedByGame =
            _.groupBy(data.gameJamPositionsForPlayer, 'game_id');

    // all game_jam_position rows for GAMES the player played in
    var gameJamPositionsGroupedByJam = groupByJam(data.gameJamPositions);

    // all game_jam_score rows for JAMS the player played in
    var gameJamScoresForPlayerGroupedByGame = _.groupBy(data.gameJamScoresForPlayer, 'game_id');

    // all game_jam_score rows for GAMES the player played in
    var gameJamScoresGroupedByGame = _.groupBy(data.gameJamScores, 'game_id');

    // all game_jam_score rows for GAMES the player played in
    var gameJamScoresGroupedByJam = groupByJam(data.gameJamScores);

    var gamesIndexed = _.keyBy(data.games, 'game_id');

    // all jams for GAMES the player played in
    var jamsGroupByGame = _.groupBy(data.jams, 'game_id');

    // sort by date asc
    // game_player rows where player_id === player.player_id
    var gamePlayersForPlayerSorted = _.sortBy(data.gamePlayersForPlayer, function (gamePlayer) {

        if (!_.has(gamesIndexed, gamePlayer.game_id)) {
            throw new Error('Bad Implementation');
        }

        return moment(gamesIndexed[gamePlayer.game_id].game_date_time).unix();
    });

    var gamePlayersGroupedByGameIndexedByPlayer = Util.groupAndIndexBy(
        data.gamePlayers,
        'game_id',
        'player_id'
    );

    var dateCol = {
        headerName: 'Date',
        pinned: 'left',
        filterParams: {
            cellRenderer: function (params) {

                return moment(+params.value).format('MMM Do, YYYY');
            }
        },
        valueGetter: function (params) {

            if (params.node.floating) {
                return params.data.label;
            }

            return params.data.date.valueOf();
        },
        cellRenderer: function (params) {

            if (params.node.floating) {
                return '<strong>' + params.value + '</strong>';
            }

            return params.data.date.format('MMM Do, YYYY');
        }
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
            colorClass = 'mod-color-green';
        } else if (params.value < 0) {
            colorClass = 'mod-color-red';
        }

        return '<span class="' + colorClass + '">' + params.value + '</span>';
    }

    function groupByJam(collection) {

        var result = {};

        _.forEach(collection, function (value) {

            var jam = [value.game_id, value.period, value.jam];

            if (!_.has(result, jam)) {
                _.set(result, jam, []);
            }

            _.get(result, jam).push(value);
        });

        return result;
    }

    function getPosition(gameJamPositionsForJamForTeam, position) {

        return _.find(gameJamPositionsForJamForTeam, { position: position });
    }

    function defaultCellRenderer(params) {

        if (params.value === null) {
            return '<div class="text-center">-</div>';
        }

        return params.value;
    }

    // Public API

    playerCtrl.player = data.player;

    // set the player's number to the number used in the player's most recent game
    playerCtrl.player.number = (gamePlayersForPlayerSorted.length) ?
        _.last(gamePlayersForPlayerSorted).number :
        '';

    playerCtrl.formatPotential = formatPercent;

    (function gamesTable() {

        var columnDefs = [
            dateCol,
            {
                headerName: 'Team',
                field: 'team',
                pinned: 'left',
                cellRenderer: defaultCellRenderer
            },
            {
                headerName: 'Opponent',
                field: 'opponent',
                pinned: 'left',
                cellRenderer: function (params) {

                    if (params.value === null) {
                        return '<div class="text-center">-</div>';
                    }

                    return ((params.data.isHomeTeam) ? 'vs' : '@') + ' ' + params.value;
                }
            },
            {
                headerName: '# Game Jams',
                field: 'numGameJams',
                cellClass: ['text-right'],
                suppressMenu: true
            },
            {
                headerName: 'Game +/-',
                field: 'gamePlusMinus',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: condtionalColorCellRenderer
            },
            {
                headerName: '# Player Jams',
                field: 'numPlayerJams',
                cellClass: ['text-right'],
                suppressMenu: true
            },
            {
                headerName: 'Player +/-',
                field: 'playerPlusMinus',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: condtionalColorCellRenderer
            },
            {
                headerName: 'Contribution #1',
                field: 'contribution1',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: function (params) {

                    if (params.value === null) {
                        return '<div class="text-center">-</div>';
                    }

                    return formatNumber(params.value);
                }
            },
            {
                headerName: 'Contribution #2',
                field: 'contribution2',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: function (params) {

                    if (params.value === null) {
                        return '<div class="text-center">-</div>';
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
                    label: 'Total',
                    team: null,
                    opponent: null,
                    numGameJams: totalNumGameJams,
                    gamePlusMinus: totalGamePlusMinus,
                    numPlayerJams: totalNumPlayerJams,
                    playerPlusMinus: totalPlayerPlusMinus,
                    contribution1: null,
                    contribution2: null
                };

                // contribution #1 and #2 are weighted avgs based on the num player jams
                var avgRow = {
                    label: 'Average',
                    team: null,
                    opponent: null,
                    numGameJams: (totalGames === 0) ? 0 : totalNumGameJams / totalGames,
                    gamePlusMinus: (totalGames === 0) ? 0 : totalGamePlusMinus / totalGames,
                    numPlayerJams: (totalGames === 0) ? 0 :totalNumPlayerJams / totalGames,
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

        playerCtrl.gamesTableGridOptions = gridOptions;

        playerCtrl.clearAllGamesTableFilters = function () {

            gridOptions.api.setFilterModel(null);
            gridOptions.api.onFilterChanged();
        };

        // -- Init

        function initTable() {

            _.forEach(gamePlayersForPlayerSorted, function (gamePlayer) {

                var gameId = gamePlayer.game_id;

                if (!_.has(gamesIndexed, gameId)) {
                    throw new Error('Bad Implementation');
                }

                var date = moment(gamesIndexed[gameId].game_date_time);

                var isHomeTeam;
                var team = gamePlayer.league + ' ' + gamePlayer.team;
                var opponent = '';

                // is the player's team the home team?
                if (gamePlayer.team === gamesIndexed[gameId].team_home) {

                    isHomeTeam = true;

                    opponent = gamesIndexed[gameId].league_away + ' ' +
                            gamesIndexed[gameId].team_away;
                }

                // is the player's team the away team?
                else if (gamePlayer.team === gamesIndexed[gameId].team_away) {

                    isHomeTeam = false;

                    opponent = gamesIndexed[gameId].league_home + ' ' +
                            gamesIndexed[gameId].team_home;
                } else {
                    throw new Error('Bad Implementation');
                }

                var strengthRatio = 1;

                if (gamesIndexed[gameId].team_home_avg_points !== 0 &&
                    gamesIndexed[gameId].team_away_avg_points !== 0) {

                    strengthRatio = (isHomeTeam) ?
                        (gamesIndexed[gameId].team_away_avg_points /
                                gamesIndexed[gameId].team_home_avg_points) :
                        (gamesIndexed[gameId].team_home_avg_points /
                                gamesIndexed[gameId].team_away_avg_points);
                }

                var playerPlusMinusPartitioned = _.has(
                    gameJamScoresForPlayerGroupedByGame,
                    gameId
                ) ?
                    _(gameJamScoresForPlayerGroupedByGame[gameId])
                        .partition(function (gameJamScore) {

                            return gameJamScore.team === gamePlayer.team;
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

                // Even though the pivot can become the jammer during a jam via a panty pass, the
                // game_jam_position table has a unique key (game_id, period, jam, team, playerid).
                // As a result, a player can only have game_jam_position row per jam.
                var numPlayerJams = _.has(gameJamPositionsForPlayerGroupedByGame, gameId) ?
                    gameJamPositionsForPlayerGroupedByGame[gameId].length :
                    0;

                var numGameJams = _.has(jamsGroupByGame, gameId) ?
                    jamsGroupByGame[gameId].length :
                    0;

                var jamRatio = (numGameJams === 0) ? 0 : numPlayerJams / numGameJams;

                var gamePlusMinusPartitioned = _.has(gameJamScoresGroupedByGame, gameId) ?

                    _(gameJamScoresGroupedByGame[gameId])
                        .partition(function (gameJamScore) {

                            return gameJamScore.team === gamePlayer.team;
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
                    isHomeTeam: isHomeTeam,
                    team: team,
                    opponent: opponent,
                    numGameJams: numGameJams,
                    gamePlusMinus: gamePlus - gameMinus,
                    numPlayerJams: numPlayerJams,
                    playerPlusMinus: playerPlus - playerMinus,
                    contribution1: contribution1,
                    contribution2: contribution2
                });
            });

            playerCtrl.numGames = gamePlayersForPlayerSorted.length;

            gridOptions.api.setRowData(rowData);
        }
    }());

    (function jamsTable() {

        function booleanCellRenderer(params) {

            if (params.node.floating) {
                return params.value;
            }

            return (params.value) ?
                '<span class="fa fa-check mod-color-green"></span>' :
                '<span class="fa fa-times mod-color-red"></span>';
        }

        function positionCellRenderer(params) {

            // Is there no player for this position?
            if (params.value === undefined) {
                return '<div class="text-center">-</div>';
            }

            if (params.node.floating) {
                return params.value;
            }

            var gamePlayer = _.get(
                gamePlayersGroupedByGameIndexedByPlayer,
                [params.value.game_id, params.value.player_id],
                null
            );

            if (gamePlayer === null) {
                throw new Error('Bad Implementation');
            }

            var calloutClass = (gamePlayer.player_id === playerCtrl.player.player_id) ?
                'callout' :
                '';

            return '<div class="' + calloutClass + '">' +
                '<span tooltip="' + gamePlayer.derby_name + '">' +
                    gamePlayer.number +
                '</span>' +
            '</div>';
        }

        function positionPenaltiesCellRenderer(params) {

            // Is there no player for this position?
            if (params.value === undefined) {
                return '<div class="text-center">-</div>';
            }

            if (params.node.floating) {
                return '<div class="text-center">-</div>';
            }

            return params.value.penalties + params.value.post_pass_penalties;
        }

        function getGameDescription(game) {

            return game.team_away + ' @ ' + game.team_home;
        }

        var columnDefs = [
            dateCol,
            {
                headerName: 'Game',
                pinned: 'left',
                filterParams: {
                    cellRenderer: function (params) {

                        if (!_.has(gamesIndexed, params.value)) {
                            throw new Error('Bad Implementation');
                        }

                        return getGameDescription(gamesIndexed[params.value]);
                    }
                },
                valueGetter: function (params) {

                    if (params.node.floating) {
                        return null;
                    }

                    return params.data.game.gameId;
                },
                cellRenderer: function (params) {

                    if (params.value === null) {
                        return '<div class="text-center">-</div>';
                    }

                    return params.data.game.description;
                }
            },
            {
                headerName: 'Period',
                field: 'period',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: defaultCellRenderer
            },
            {
                headerName: 'Jam',
                field: 'jam',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: defaultCellRenderer
            },
            {
                headerName: 'Lead Jammer?',
                field: 'isLeadJammer',
                cellClass: ['text-center'],
                suppressMenu: true,
                cellRenderer: booleanCellRenderer
            },
            {
                headerName: 'Power Jam?',
                field: 'isPowerJam',
                cellClass: ['text-center'],
                suppressMenu: true,
                cellRenderer: booleanCellRenderer
            },
            {
                headerName: 'Panty Pass?',
                field: 'isPantyPass',
                cellClass: ['text-center'],
                suppressMenu: true,
                cellRenderer: booleanCellRenderer
            },
            {
                headerName: 'Jammer',
                field: 'jammer',
                suppressMenu: true,
                cellRenderer: positionCellRenderer
            },
            {
                headerName: 'Jammer Penalties',
                field: 'jammer',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: positionPenaltiesCellRenderer
            },
            {
                headerName: 'Pivot',
                field: 'pivot',
                suppressMenu: true,
                cellRenderer: positionCellRenderer
            },
            {
                headerName: 'Pivot Penalties',
                field: 'pivot',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: positionPenaltiesCellRenderer
            },
            {
                headerName: 'Blocker 1',
                field: 'blocker1',
                suppressMenu: true,
                cellRenderer: positionCellRenderer
            },
            {
                headerName: 'Blocker 1 Penalties',
                field: 'blocker1',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: positionPenaltiesCellRenderer
            },
            {
                headerName: 'Blocker 2',
                field: 'blocker2',
                suppressMenu: true,
                cellRenderer: positionCellRenderer
            },
            {
                headerName: 'Blocker 2 Penalties',
                field: 'blocker2',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: positionPenaltiesCellRenderer
            },
            {
                headerName: 'Blocker 3',
                field: 'blocker3',
                suppressMenu: true,
                cellRenderer: positionCellRenderer
            },
            {
                headerName: 'Blocker 3 Penalties',
                field: 'blocker3',
                cellClass: ['text-right'],
                suppressMenu: true,
                cellRenderer: positionPenaltiesCellRenderer
            },
            {
                headerName: 'Total Penalties',
                field: 'totalPenalties',
                cellClass: ['text-right'],
                suppressMenu: true
            },
            {
                headerName: 'Points For',
                field: 'pointsFor',
                cellClass: ['text-right'],
                cellRenderer: defaultCellRenderer
            },
            {
                headerName: 'Points Against',
                field: 'pointsAgainst',
                cellClass: ['text-right'],
                cellRenderer: defaultCellRenderer
            },
            {
                headerName: '+/-',
                field: 'plusMinus',
                cellClass: ['text-right'],
                cellRenderer: condtionalColorCellRenderer
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

                var totalJams = 0;

                var totalLeadJammers = 0;

                var totalPowerJams = 0;

                var totalPantyPasses = 0;

                var totalJamsAsJammer = 0;

                var totalJamsAsPivot = 0;

                var totalJamsAsBlocker1 = 0;

                var totalJamsAsBlocker2 = 0;

                var totalJamsAsBlocker3 = 0;

                var totalPenalties = 0;

                var totalPointsFor = 0;

                var totalPointsAgainst = 0;

                gridOptions.api.forEachNodeAfterFilter(function (row) {

                    totalJams++;

                    if (row.data.isLeadJammer) {
                        totalLeadJammers += 1;
                    }

                    if (row.data.isPowerJam) {
                        totalPowerJams += 1;
                    }

                    if (row.data.isPantyPass) {
                        totalPantyPasses += 1;
                    }

                    switch (row.data.position) {

                        case 'Jammer':
                            totalJamsAsJammer += 1;
                            break;
                        case 'Pivot':
                            totalJamsAsPivot += 1;
                            break;
                        case 'Blocker1':
                            totalJamsAsBlocker1 += 1;
                            break;
                        case 'Blocker2':
                            totalJamsAsBlocker2 += 1;
                            break;
                        case 'Blocker3':
                            totalJamsAsBlocker3 += 1;
                            break;
                        default:
                            break;
                    }

                    totalPenalties += row.data.totalPenalties;

                    totalPointsFor += row.data.pointsFor;

                    totalPointsAgainst += row.data.pointsAgainst;
                });

                var plusMinus = totalPointsFor - totalPointsAgainst;

                var totalRow = {
                    label: 'Total',
                    period: null,
                    jam: null,
                    isLeadJammer: totalLeadJammers,
                    isPowerJam: totalPowerJams,
                    isPantyPass: totalPantyPasses,
                    jammer: totalJamsAsJammer,
                    pivot: totalJamsAsPivot,
                    blocker1: totalJamsAsBlocker1,
                    blocker2: totalJamsAsBlocker2,
                    blocker3: totalJamsAsBlocker3,
                    totalPenalties: totalPenalties,
                    pointsFor: totalPointsFor,
                    pointsAgainst: totalPointsAgainst,
                    plusMinus: plusMinus
                };

                playerCtrl.numJamsAfterFilter = totalJams;

                var floatingBottomRowData = [totalRow];

                gridOptions.api.setFloatingBottomRowData(floatingBottomRowData);
            }

            // -- Callbacks
        };

        playerCtrl.jamsTableGridOptions = gridOptions;

        playerCtrl.clearAllJamsTableFilters = function () {

            gridOptions.api.setFilterModel(null);
            gridOptions.api.onFilterChanged();
        };

        // -- Init

        function initTable() {

            _.forEach(data.gameJamPositionsForPlayer, function (gameJamPosition) {

                var gameId = gameJamPosition.game_id;

                if (!_.has(gamesIndexed, gameId)) {
                    throw new Error('Bad Implementation');
                }

                var date = moment(gamesIndexed[gameId].game_date_time);

                var game = {
                    gameId: gameJamPosition.game_id,
                    description: getGameDescription(gamesIndexed[gameId])
                };

                var jam = [gameJamPosition.game_id, gameJamPosition.period, gameJamPosition.jam];

                if (!_.has(gameJamScoresGroupedByJam, jam)) {
                    throw new Error('Bad Implementation');
                }

                var gameJamScoresForJam = _.get(gameJamScoresGroupedByJam, jam);

                var gameJamScoresForJamPartitioned = _.partition(
                    gameJamScoresForJam,
                    function (gameJameScore) {

                        return gameJameScore.team === gameJamPosition.team;
                    }
                );

                var gameJamScoresForJamForTeam = gameJamScoresForJamPartitioned[0];

                var gameJamScoresForJamForOpponent = gameJamScoresForJamPartitioned[1];

                var isLeadJammer = _.reduce(
                    gameJamScoresForJamForTeam,
                    function (isLeadJammer, gameJamScore) {

                        return isLeadJammer || gameJamScore.lead_jammer;
                    },
                    false
                );

                var gameJamPositionsForJam = _.get(gameJamPositionsGroupedByJam, jam);

                var gameJamPositionsForJamPartitioned = _.partition(
                    gameJamPositionsForJam,
                    function (gameJamePosition) {

                        return gameJamePosition.team === gameJamPosition.team;
                    }
                );

                var gameJamPositionsForJamForTeam = gameJamPositionsForJamPartitioned[0];

                var gameJamPositionsForJamForOpponent = gameJamPositionsForJamPartitioned[1];

                var isPowerJam = (_.findIndex(
                    gameJamPositionsForJamForOpponent,
                    function (gameJamPosition) {

                        return ((gameJamPosition.position === 'Jammer' &&
                                gameJamPosition.penalties > 0) ||
                            (gameJamPosition.position === 'Pivot' &&
                                gameJamPosition.post_pass_penalties > 0));
                    }
                ) >= 0);

                var isPantyPass = _.reduce(
                    gameJamScoresForJamForTeam,
                    function (isPantyPass, gameJamScore) {

                        return isPantyPass || gameJamScore.pass_occurred;
                    },
                    false
                );

                if (!_.has(gameJamPositionsGroupedByJam, jam)) {
                    throw new Error('Bad Implementation');
                }

                // It is possible (but rare) that one of the positions below is undefined. E.g. A
                // team forgets to put one of the players on the track or the team doesn't have
                // enough players left for a full lineup.

                var jammer = getPosition(gameJamPositionsForJamForTeam, 'Jammer');

                var pivot = getPosition(gameJamPositionsForJamForTeam, 'Pivot');

                var blocker1 = getPosition(gameJamPositionsForJamForTeam, 'Blocker1');

                var blocker2 = getPosition(gameJamPositionsForJamForTeam, 'Blocker2');

                var blocker3 = getPosition(gameJamPositionsForJamForTeam, 'Blocker3');

                var totalPenalties =
                    ((jammer === undefined) ?
                        0 :
                        (jammer.penalties + jammer.post_pass_penalties)) +
                    ((pivot === undefined) ?
                        0 :
                        (pivot.penalties + pivot.post_pass_penalties)) +
                    ((blocker1 === undefined) ?
                        0 :
                        (blocker1.penalties + blocker1.post_pass_penalties)) +
                    ((blocker2 === undefined) ?
                        0 :
                        (blocker2.penalties + blocker2.post_pass_penalties)) +
                    ((blocker3 === undefined) ?
                        0 :
                        (blocker3.penalties + blocker3.post_pass_penalties));

                var pointsFor = _.reduce(
                    gameJamScoresForJamForTeam,
                    function (pointsFor, gameJamScore) {

                        return pointsFor + gameJamScore.points;
                    },
                    0
                );

                var pointsAgainst = _.reduce(
                    gameJamScoresForJamForOpponent,
                    function (pointsFor, gameJamScore) {

                        return pointsFor + gameJamScore.points;
                    },
                    0
                );

                var plusMinus = pointsFor - pointsAgainst;

                rowData.push({
                    date: date,
                    game: game,
                    period: gameJamPosition.period,
                    jam: gameJamPosition.jam,
                    isLeadJammer: isLeadJammer,
                    isPowerJam: isPowerJam,
                    isPantyPass: isPantyPass,
                    jammer: jammer,
                    pivot: pivot,
                    blocker1: blocker1,
                    blocker2: blocker2,
                    blocker3: blocker3,
                    totalPenalties: totalPenalties,
                    pointsFor: pointsFor,
                    pointsAgainst: pointsAgainst,
                    plusMinus: plusMinus,
                    position: gameJamPosition.position
                });
            });

            playerCtrl.numJams = data.gameJamPositionsForPlayer.length;

            gridOptions.api.setRowData(rowData);
        }
    }());
};
