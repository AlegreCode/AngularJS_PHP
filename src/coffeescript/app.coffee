window.$ = window.jQuery = require('jquery')
bootstrap = require('../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js')

appAngular = require('./modules/appAngular.coffee')
# strtonumDirective = require("./modules/strtonumDirective.coffee")

angularConfig = require('./modules/angularConfig.coffee')

factoryTareas = require("./modules/factoryUsuarios.coffee")

navbarController = require('./modules/navbarController.coffee')
errorController = require("./modules/errorController.coffee")
listaController = require("./modules/listaController.coffee")
agregarController = require("./modules/agregarController.coffee")
editarController = require("./modules/editarController.coffee")


do ($ = jQuery) ->
    console.log "Work!"
