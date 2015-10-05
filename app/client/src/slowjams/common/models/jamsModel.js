'use strict';

angular.module('SlowJams.Common')
    .factory('JamsModel', ['$http', function ($http) {

        return {
            all: function () {

                return $http.get('/api/v1/jams');
            }
        };
    }]);
