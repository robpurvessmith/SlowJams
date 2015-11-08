'use strict';

module.exports = function ($http) {

    return {
        all: function () {

            return $http.get('/api/v1/jams');
        }
    };
};
