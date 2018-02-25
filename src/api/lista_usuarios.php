<?php

header("Content-type: application/json;charset= UTF-8");

require_once "Conexion.php";

$cnx = new Conexion();

$resultado = $cnx->getAllUser();

echo json_encode($resultado);

