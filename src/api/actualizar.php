<?php

header("Content-Type: application/json;charset= UTF-8");

require_once "Conexion.php";

// ==============================================
// SOLUCION ALTERNATIVA SIN USO DE JQUERY ($.param()) EN EL FACTORY QUE HACE LA PETICION
// $postdata = file_get_contents("php://input");
// $request = json_decode($postdata);

// $datos = [
//   "id" => $request->id,
//   "nombre" => $request->nombre,
//   "username" => $request->username,
//   "email" => $request->email,
//   "privilegio" => $request->privilegio,
//   "password" => $request->password,
// ];

// $res = $cnx->actualizar($datos);

// if ($res) {
//   $estado = ["estado" => true];
// } else {
//   $estado = ["estado" => false];
// }
// ==============================================

if (isset($_POST["id"]) && isset($_POST["nombre"]) && isset($_POST["username"]) && isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["privilegio"])) {
  $cnx = new Conexion();

  $datos = [];
  $estado = [];

  $datos = [
    "id" => $_POST["id"],
    "nombre" => $_POST["nombre"],
    "username" => $_POST["username"],
    "email" => $_POST["email"],
    "privilegio" => $_POST["privilegio"],
    "password" => $_POST["password"],
  ];

  $res = $cnx->actualizar($datos);

  if ($res) {
    $resultado = $cnx->getUser($datos["id"]);
  } else {
    $resultado = ["estado" => false];
  }

}



echo json_encode($resultado);
