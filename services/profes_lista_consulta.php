<?php
  include "conexion.php";

  	$sql=mysqli_query($conn,"SELECT * FROM tbl_cicle");




  $pokemons=array();
  while($row = mysqli_fetch_assoc($sql)){
   
    $pokemons[]=$row;



  }
  /*
      $ch = {
    "nom_cicle": "Nombre Ciclo",
    "nom_modul": "Nombre Modulo"
};
   $pokemons.push($ch);
   */
  print json_encode($pokemons);
?>