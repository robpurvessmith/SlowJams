'use strict';

angular.module('SlowJams.Player')
    .controller('PlayerCtrl', ['data', function (data) {

        var player = this;

        player.player = data.player;

        player.games = data.games;

        player.jams = _.filter(data.jams, function (jam) {

            return jam.PlayerID === player.player.playerId;
        });
    }]);
