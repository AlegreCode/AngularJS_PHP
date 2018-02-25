appAngular = require("./appAngular.coffee")

module.exports = appAngular.controller("agregarController",["$scope","$location", "datos",($scope, $location, datos) ->

  $scope.usuario = {}

  $scope.goAgregar = (usuario) ->
    datos.add(usuario)
    $location.path("/usuarios")

  $scope.goCancelar = ->
    $location.path("/usuarios")
])
