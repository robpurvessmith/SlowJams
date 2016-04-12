'use strict';

var _ = require('lodash');

exports.groupAndIndexBy = function (collection, groupByProperty, indexByProperty) {

    collection = _.groupBy(collection, groupByProperty);

    _.each(collection, function (group, key) {

        collection[key] = _.keyBy(group, indexByProperty);
    });

    return collection;
};

exports.groupAndGroupBy = function (collection, groupByProperty1, groupByProperty2) {

    collection = _.groupBy(collection, groupByProperty1);

    _.forEach(collection, function (group, key) {

        collection[key] = _.groupBy(group, groupByProperty2);
    });

    return collection;
};

/**
 * The $q service doesn't have function to "spread" the values over the arguments of the fulfillment
 * handler. This function creates a function that takes 1 argumet, an array of objects where each
 * object has a 'data' key, and invokes func with the values for the 'data' keys.
 */
exports.qSpread = function (func) {

    return function (array) {

        return _.spread(func)(_.map(array, 'data'));
    };
};
