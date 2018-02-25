appAngular = require("./appAngular.coffee")

module.exports = appAngular.factory("datos",["$http", "$filter", ($http, $filter) ->
  datos = {}
  datos.usuarios = []

  datos.usuario = {}
  datos.usuarioAntiguo = {}

  # comun.eliminar = (tarea) ->
  #   i = comun.tareas.indexOf(tarea)
  #   comun.tareas.splice(i,1)

  datos.getUsuarios = ->
    return $http.get("/api/lista_usuarios.php")
    .then((res)->
      angular.copy(res.data, datos.usuarios)
      return datos.usuarios
    )

  datos.getUsuario = (id) ->
    return $http.get("/api/get_usuario.php?id=" + id)
    .then((res)->
      angular.copy(res.data, datos.usuario)
      angular.copy(res.data, datos.usuarioAntiguo)
      return datos.usuario
    )

  datos.actualizar = (usuario) ->
    return $http({
      method: "POST",
      url: "/api/actualizar.php",
      data: $.param({
        id: usuario.id,
        nombre: usuario.nombre,
        username: usuario.username,
        email: usuario.email,
        password: usuario.password,
        privilegio: usuario.privilegio
      }),
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
    .then((res) ->

      valor = $filter("filter")(datos.usuarios, datos.usuarioAntiguo, true)[0]
      i = $.inArray(valor, datos.usuarios)
      datos.usuarios[i] = res.data
    )

  datos.add = (usuario) ->
    return $http({
      method: "POST",
      url: "/api/nuevo_usuario.php",
      data: $.param({
        nombre: usuario.nombre,
        username: usuario.username,
        email: usuario.email,
        password: usuario.password,
        privilegio: usuario.privilegio
      }),
      headers: {"Content-Type" : "application/x-www-form-urlencoded"}
    })
    .then((res) ->
      datos.usuarios.push(res.data)
    )

  datos.delete = (usuario) ->
    return $http.get("/api/delete_usuario.php?id=" + usuario.id)
    .then((res) ->
      obj = $filter("filter")(datos.usuarios, usuario, true)[0]
      i = $.inArray(obj, datos.usuarios)
      datos.usuarios.splice(i,1)
      return res.data
    )

  return datos
])
