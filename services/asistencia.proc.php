<?php

	include 'conexion.php';

	//Recuperamos la variable de id_usuario de la url

	$id_usuari = $_REQUEST['id_usuari'];


	//Variable para tener la hora actual

	$hora=date('H:i:s');


	//$fecha=date('d-m-Y');
	//echo $hora;



	//Array con los dias de la semana

	$dias = array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");

	//echo "Buenos días, hoy es ".$dias[date("N")];



	//Variable que te da el valor numerico del dia de la semana y recoge el nombre de la array

	$dia=$dias[date("N")];

	

	//Consulta para recoger el id_classe dependiendo del dia actual

	$result = mysqli_query($conn, "SELECT * FROM tbl_classe_uf INNER JOIN tbl_edicio_uf ON tbl_classe_uf.id_ed_uf=tbl_edicio_uf.id_ed_uf WHERE dia_classe='$dia'");
	$row = mysqli_fetch_array($result);
    $id_classe=$row['id_classe'];

	
	

	//echo "SELECT * FROM tbl_classe_uf INNER JOIN tbl_edicio_uf ON tbl_classe_uf.id_ed_uf=tbl_edicio_uf.id_ed_uf WHERE id_usuari=$id_usuari";

	echo $row['hora_ini_classe'] ;

	//Si la hora actual esta entre la hora de inicio y final de la clase, y el dia actual tambien coincide, hace el insert en la base de datos


	if ($hora>$row['hora_ini_classe'] && $hora<$row['hora_fi_classe'] && $dias[date("N")]=$row['dia_classe']) {
		
		$result1 = mysqli_query($conn, "INSERT INTO `tbl_assist_classe`(`hora_assist_classe`, `present`, `id_usuari`, `id_classe`) VALUES ('".$hora."',1,".$id_usuari.",".$id_classe.")");

		echo "BIENNNNNNNNNNN";
	}





	

	

	

	//echo "INSERT INTO `tbl_assist_classe`(`hora_assist_classe`, `present`, `id_usuari`, `id_classe`) VALUES ('".$hora."',1,".$id_usuari.",1)";


	



?>