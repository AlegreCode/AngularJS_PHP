<?php

header("Content-Type: application/json;charset=UTF-8");

require_once "Conexion.php";

if($_SERVER["REQUEST_METHOD"] === "GET")
if (isset($_GET["id"])) {
  $datos = [];
  $estado = [];

  $datos = [
    "id" => $_GET["id"]
  ];

  $cnx = new Conexion();

  $res = $cnx->deleteUser($datos);

  if ($res) {
    $estado = ["estado" => true];
  } else {
    $estado = ["estado" => true];
  }

  echo json_encode($estado);


}
