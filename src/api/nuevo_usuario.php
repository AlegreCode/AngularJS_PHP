<?php

header("Content-Type: application/json;charset= UTF-8");

require_once "Conexion.php";

if (isset($_POST["nombre"]) && isset($_POST["username"]) && isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["privilegio"])) {
  $datos = [];
  $estado = [];

  $datos = [
    "nombre" => $_POST["nombre"],
    "username" => $_POST["username"],
    "email" => $_POST["email"],
    "password" => $_POST["password"],
    "privilegio" => $_POST["privilegio"],
  ];

  $cnx = new Conexion();
  $cnx->nuevoUsuario($datos);
  // OBTIENE EL ULTIMO REGISTRO INGRESASDO
  $res = $cnx->getLastUser();


  echo json_encode($res);

}
