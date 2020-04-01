<?php
//header('Content-Type: text/txt; charset=utf-8');
  include "conexion.php";
  //session_start();
  	$sql=mysqli_query($conn,"SELECT * FROM tbl_cicle");

  $pokemons=array();
  while($row = mysqli_fetch_assoc($sql)){
   
    $pokemons[]=$row;

  }

/*for ($i=0; $i < count($pokemons); $i++) { 
 //print_r( utf8_encode(implode($pokemons[$i])) );
	print_r($pokemons[$i]);
}*/
 //print_r($pokemons[0]);


//print json_encode( utf8_encode(implode($pokemons)) );
 print json_encode($pokemons);


  //$cadena = json_encode($pokemons);
  //print_r($cadena);
  //echo $cadena;
?>