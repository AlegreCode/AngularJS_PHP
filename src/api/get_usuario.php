<?php

header("Content-type: application/json;charset= UTF-8");

require_once "Conexion.php";

$con = new Conexion();

if(isset($_GET["id"])){
  $id = $_GET["id"];
  $resultado = $con->getUser($id);

  echo json_encode($resultado);
}
