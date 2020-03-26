<?php

include 'conexion.php';

$user = $_REQUEST['user'];
$pass = $_REQUEST['password'];
$encript = md5($pass);

//Entra si está configurada la variable del formulario del login
if(isset($_REQUEST['user'])){


	//Funcion que permite que el usuario NO pueda hacer MySQL Injection
	//$result = mysqli_query($conn, "SELECT * FROM tbl_alumne WHERE login_alu='" . mysqli_real_escape_string($conn, $user) . "' AND pwd_alu='$encript'");


	//Esta funcion comprueba en la base de datos que esté el usuario y la contraseña introducidos en el formulario
	$result = mysqli_query($conn, "SELECT * FROM `tbl_usuari` WHERE `codi_usuari`='$user' AND `password_usuari`='$encript'");

	
	//La variable $result debería de tener como mínimo un registro coincidente
	if(!empty($result) && mysqli_num_rows($result)==1){
		$row = mysqli_fetch_array($result);

	if ($row['status_usuari']!="actiu") {
		echo "El usuario esta Bloqueado o Eliminado";
	}else{
		//Creo una nueva sesión y defino $_SESSION['nombre']
		session_start();
		$_SESSION['codi_usuari']=$user;
		$_SESSION['nom']=$row['nom_usuari'];
		$_SESSION['cognom1']=$row['cognom1_usuari'];
		$_SESSION['cognom2']=$row['cognom2_usuari'];

		//Voy a mi sitio personal
		//echo $_SESSION['nombre'];
		if ($row['id_tipus_usuari']==1) {
			header("Location: ../views/profes_index.php");
		}else if ($row['id_tipus_usuari']==2){
			header("Location: ../views/alumnos_index.php");
		}
		
	}
	}else{
		//Ha fallado la autenticación vuelvo a login.php
		header("Location: ../login.php?error=1");
		
	}
//Si no está configurada la variable del formulario del login vuelve al login.php
}else{
	header("Location: login.php");
}	
?>