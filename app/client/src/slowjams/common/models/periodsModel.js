'use strict';

angular.module('SlowJams.Common')
    .factory('PeriodsModel', ['$http', function ($http) {

        return {
            all: function () {

                return $http.get('/api/v1/periods');
            }
        };
    }]);

