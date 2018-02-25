appAngular = require("./appAngular.coffee")

module.exports = appAngular.controller("editarController",["$scope","$location","$routeParams","datos", ($scope, $location, $routeParams, datos)->

  $scope.usuario = {}

  datos.getUsuario($routeParams.id)

  $scope.usuario = datos.usuario

  $scope.goCancelar = ->
    $location.path("/usuarios")

  $scope.goActualizar = (usuario) ->
    datos.actualizar(usuario)
    $location.path("/usuarios")


])
