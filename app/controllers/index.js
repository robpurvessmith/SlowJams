'use strict';

exports.index = function(req, res, next) {

    res.render(
        'index',
        {
            title: 'Slow Jams',
            msg: 'Hello Derby!'
        }
    );
}
