'use strict';

angular.module('SlowJams.Player')
    .factory('PlayerCtrlDataService', ['$q', 'BoutsModel', 'JamsModel',
        function ($q, BoutsModel, JamsModel) {

            return {
                getData: function(playerId) {

                    var boutsPromise = BoutsModel.all();
                    var jamsPromise = JamsModel.all();

                    return $q.all([boutsPromise, jamsPromise])
                        .then(function (results) {

                            return {
                                player: {
                                    playerId: playerId,
                                    name: 'foo bar baz'
                                },
                                bouts: results[0].data,
                                jams: results[1].data
                            };
                        })
                        .catch(function (error) {

                            // TODO: handle error
                        });
                }
            };
        }
    ]);
