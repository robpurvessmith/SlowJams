'use strict';

angular.module('SlowJams.Common')
    .factory('BoutsModel', ['$http', function ($http) {

        return {
            all: function () {

                return $http.get('/api/v1/bouts');
            }
        };
    }]);
