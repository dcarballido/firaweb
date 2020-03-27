<?php

	include 'conexion.php';

	//Recuperamos la variable de id_usuario de la url

	$id_usuari = $_REQUEST['id_usuari'];


	//Variable para tener la hora actual

	$hora=date('H:i:s');



	//Array con los dias de la semana

	$dias = array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");



	//Variable que te da el valor numerico del dia de la semana y recoge el nombre de la array

	$dia=$dias[date("N")];

	

	//Consulta para recoger el id_classe dependiendo del dia actual

	$result = mysqli_query($conn, "SELECT * FROM tbl_classe_uf INNER JOIN tbl_edicio_uf ON tbl_classe_uf.id_ed_uf=tbl_edicio_uf.id_ed_uf WHERE dia_classe='$dia'");
	$row = mysqli_fetch_array($result);
    $id_classe=$row['id_classe'];



	//Si la hora actual esta entre la hora de inicio y final de la clase, y el dia actual tambien coincide, hace el insert en la base de datos

	$nuevafecha = strtotime ( '+5 minute' , strtotime ( $row['hora_ini_classe'] ) ) ;
	$nuevafecha1 = strtotime ( '+10 minute' , strtotime ( $row['hora_ini_classe'] ) ) ;

	//Hora de la base de datos +5 minutos
	$hora1 = date('H:i:s' , $nuevafecha );
	//Hora de la base de datos +10 minutos
	$hora2 = date('H:i:s' , $nuevafecha1 );


	echo $hora1;

	echo "<br>";

	echo $hora2;



	if ($hora>$row['hora_ini_classe'] && $hora<$row['hora_fi_classe'] && $dias[date("N")]=$row['dia_classe']) {
		


		if ($hora>$row['hora_ini_classe'] && $hora<$hora1) {
			//A la hora 


		$result1 = mysqli_query($conn, "INSERT INTO `tbl_assist_classe`(`hora_assist_classe`, `data_assist_classe`, `present`, `retras`, `id_usuari`, `id_classe`) VALUES ('".$hora."','".$dia."',1,0,".$id_usuari.",".$id_classe.")");
		

		echo "A LA HORA";

		}else if ($hora>$hora1 && $hora<$hora2) {
			//retard

		$result1 = mysqli_query($conn, "INSERT INTO `tbl_assist_classe`(`hora_assist_classe`, `data_assist_classe`, `present`, `retras`, `id_usuari`, `id_classe`) VALUES ('".$hora."','".$dia."',1,1,".$id_usuari.",".$id_classe.")");
		
		echo "RETARD";

	}else{
		//Falta

		$result1 = mysqli_query($conn, "INSERT INTO `tbl_assist_classe`(`hora_assist_classe`, `data_assist_classe`, `present`, `retras`, `id_usuari`, `id_classe`) VALUES ('".$hora."','".$dia."',0,0,".$id_usuari.",".$id_classe.")");

		echo "FALTA";
	}
		
		

	}else{

		echo "Hoy es Sabado o Domingo, o ha ocurrido un error";
	}





	

	

	

	//echo "INSERT INTO `tbl_assist_classe`(`hora_assist_classe`, `present`, `id_usuari`, `id_classe`) VALUES ('".$hora."',1,".$id_usuari.",1)";


	



?>