appAngular = require("./appAngular.coffee")

module.exports = appAngular.config(["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode(true)

    $routeProvider.when("/",{
        templateUrl: "views/home.html"
    })
    .when("/usuarios",{
        templateUrl: "views/usuarios.html"
    })
    .when("/agregar",{
        templateUrl: "views/agregar.html",
        controller: "agregarController"
    })
    .when("/editar/:id",{
        templateUrl: "views/editar.html",
        controller: "editarController"
    })
    .when("/404",{
        templateUrl: "views/error.html",
        controller: "errorController"
    })
    .otherwise({
        redirectTo: "/404"
    })
])
