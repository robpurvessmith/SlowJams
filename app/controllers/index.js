'use strict';

exports.index = function(req, res, next) {

    var options = {
        root: __dirname + '/../views/'
    };

    res.sendFile('index.html', options);
}
