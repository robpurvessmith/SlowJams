'use strict';

angular.module('SlowJams.Bout')
    .controller('BoutsCtrl', ['data', function (data) {

        var bouts = this;

        bouts.bouts = data.bouts;

    }]);
