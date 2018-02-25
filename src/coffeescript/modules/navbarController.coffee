appAngular = require("./appAngular.coffee")

module.exports = appAngular.controller("navbarController",["$scope", "$location", ($scope, $location) ->
    $scope.goHome = ->
        $location.path("/")
    $scope.goUsuarios = ->
        $location.path("/usuarios")
    $scope.goAgregar = ->
        $location.path("/agregar")

    $scope.esActivo = (rutaActual) ->
        return rutaActual == $location.path()
])
