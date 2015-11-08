'use strict';

module.exports = function ($q, BoutsModel) {

    return {
        getData: function (playerId) {

            return BoutsModel.all()
                .then(function (result) {

                    return {
                        bouts: result.data
                    };
                })
                .catch(function (error) {

                    // TODO: handle error
                });
        }
    };
};
