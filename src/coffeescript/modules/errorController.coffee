appAngular = require("./angularConfig.coffee")

module.exports = appAngular.controller("errorController", ["$scope","$location", ($scope, $location) ->
    $scope.goHome = ->
        $location.path("/")
])