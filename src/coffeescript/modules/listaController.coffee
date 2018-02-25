appAngular = require("./appAngular.coffee")

module.exports = appAngular.controller("listaController",["$scope","$location","$route","datos",($scope, $location, $route, datos)->

  $scope.usuarios = {}

  datos.getUsuarios()

  $scope.usuarios = datos.usuarios

  $scope.goEditar = (usuario) ->
    $location.path("/editar/" + usuario.id)

  $scope.goDelete = (usuario) ->
    res = datos.delete(usuario)

  $scope.goRefresh = ->
    $route.reload()
])
