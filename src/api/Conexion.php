<?php

class Conexion
{
  private $con;

  public function __construct() {
    $this->con = new PDO("mysql:host=localhost;dbname=login_php;charset=utf8","root","");
  }

  public function getAllUser()
  {
    $stmt = $this->con->prepare("SELECT * FROM usuarios");
    $stmt->execute();
    return $stmt->fetchAll();
    $stmt->close();
  }

  public function getUser($id)
  {
    $stmt = $this->con->prepare("SELECT * FROM usuarios WHERE id=:id");
    $stmt->bindParam(":id", $id, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetch();
    $stmt->close();
  }

  public function actualizar($datos)
  {
    $stmt = $this->con->prepare("UPDATE usuarios SET nombre=:nombre, username=:username, email=:email, password=:password, privilegio=:privilegio WHERE id=:id");
    $stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);
    $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
    $stmt->bindParam(":username", $datos["username"], PDO::PARAM_STR);
    $stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
    $stmt->bindParam(":password", $datos["password"], PDO::PARAM_STR);
    $stmt->bindParam(":privilegio", $datos["privilegio"], PDO::PARAM_INT);

    return $stmt->execute();
    $stmt->close();
  }

  public function getLastUser()
  {
    $stmt = $this->con->prepare("SELECT * FROM usuarios WHERE id=(SELECT MAX(id) FROM usuarios)");
    $stmt->execute();
    return $stmt->fetch();
    $stmt->close();
  }

  public function nuevoUsuario($datos)
  {
    // intval($datos["privilegio"]);
    $stmt = $this->con->prepare("INSERT INTO usuarios VALUES (NULL, :nombre, :username, :email, :password, :privilegio, NOW())");
    $stmt->bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
    $stmt->bindParam(":username", $datos["username"], PDO::PARAM_STR);
    $stmt->bindParam(":email", $datos["email"], PDO::PARAM_STR);
    $stmt->bindParam(":password", $datos["password"], PDO::PARAM_STR);
    $stmt->bindParam(":privilegio", $datos["privilegio"], PDO::PARAM_INT);

    return $stmt->execute();
    $stmt->close();
  }

  public function deleteUser($datos)
  {
    $stmt = $this->con->prepare("DELETE FROM usuarios WHERE id=:id");
    $stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);
    return $stmt->execute();
    $stmt->close();
  }

}
