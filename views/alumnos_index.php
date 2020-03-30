<!DOCTYPE html>
<html>
<head>
	<title>Página Alumnos</title>
	<link rel="stylesheet" type="text/css" href="../css/profesores.css">
</head>
<body>
	
	<?php
		//Mantengo la sesión. Por ende puedo utilizar la variable $_SESSION anteriormente configurada

		include '../services/conexion.php';

		session_start();

		
		?>

		<ul>
		<img class="logonet" src="../img/logonet.jpg">
	  <img class="logo" src="https://m.joan23.fje.edu/sites/all/themes/escuelas_fje_mobile/images/logo_bellvitge_fje.png">

	  <li style="float:right">

	  	<?php if(isset($_SESSION['codi_usuari'])){
			echo "<a href='../services/logout.proc.php' >Cerrar sesión de ".$_SESSION['nom']." ".$_SESSION['cognom1']." ".$_SESSION['cognom2']."</a>";
		}else{
			header("Location: ../login.php");
		} 
		?>

		<?php 
			$result = mysqli_query($conn, "SELECT `id_usuari` FROM `tbl_usuari` WHERE `codi_usuari`='".$_SESSION['codi_usuari']."'");
			$row = mysqli_fetch_array($result);
			$id_usuari=$row['id_usuari'];

		?>
			
		</li>

    </ul>
  	

    <div>
    <div>
    	<div class="benvingut">
    		<?php echo "<p>Benvingut de nou ".$_SESSION['nom']." ".$_SESSION['cognom1']." ".$_SESSION['cognom2']." <img src='https://image.flaticon.com/icons/png/512/1144/1144811.png'></p>"; ?>
    		</p>
    	</div>
    </div>
    <br>

    <div class="botones" style="margin-top: 200px; text-align: center;">
    	<a href="alumnos_horario.php"><button class="button1"><p>EL MEU HORARI</p></button></a>
    	

    		 <?php
    		 
    		 echo '<a href="../services/asistencia.proc.php?id_usuari='.$id_usuari.'"><button class="button2"> <p>ASISTENCIA</p></button></a>'

    		 ?>
    			
    		
    	
    </div>
	</div>

</body>
</html>