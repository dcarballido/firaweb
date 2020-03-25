<!DOCTYPE html>
<html>
<head>
	<title>Página Profes</title>
	<link rel="stylesheet" type="text/css" href="../css/profesores.css">
	<meta charset="UTF-8">
</head>
<body>
	<?php
		//Mantengo la sesión. Por ende puedo utilizar la variable $_SESSION anteriormente configurada
		session_start();

		
		?>

		<ul>
	  <img class="logo" src="https://m.joan23.fje.edu/sites/all/themes/escuelas_fje_mobile/images/logo_bellvitge_fje.png">

	  <li style="float:right">
	  	
	  	<?php if(isset($_SESSION['nombre'])){
			echo "<a href='../services/logout.proc.php' >Cerrar sesión de ".$_SESSION['nombre']."</a>";
		}else{
			header("Location: ../login.php");
		} 
		?>
			
		</li>

    </ul>
    <hr>
  
    <div>
    <div>
    	<div class="benvingut">
    		<p>Benvingut de nou <?php echo $_SESSION['nombre']; ?>  <img src="https://image.flaticon.com/icons/png/512/1144/1144811.png"></p>
    	</div>
    	<div class="modul">
    		<?php
	
	include '../services/conexion.php';

	//Aquí se recogería el nombre de la sesión
	$nom_usu=$_SESSION['nombre'];

	$horaActual = date('H:i:s');
	//Coge el día actual en inglés
	$diaActual = date('l');
	//echo $diaActual;

	//echo "<br>".$diaActual."<br>";

	$queryUsu = "SELECT tbl_modul.nom_modul, tbl_aula.nom_aula FROM tbl_tipus_usuari INNER JOIN tbl_usuari ON tbl_tipus_usuari.id_tipus_usuari=tbl_usuari.id_tipus_usuari INNER JOIN tbl_professor_ed_uf ON tbl_usuari.id_usuari=tbl_professor_ed_uf.id_usuari INNER JOIN tbl_edicio_uf ON tbl_professor_ed_uf.id_ed_uf=tbl_edicio_uf.id_ed_uf INNER JOIN tbl_aula ON tbl_edicio_uf.id_aula=tbl_aula.id_aula INNER JOIN tbl_edicio_uf tbl_edicio_uf2 ON tbl_aula.id_aula=tbl_edicio_uf2.id_aula INNER JOIN tbl_classe_uf ON tbl_edicio_uf2.id_ed_uf=tbl_classe_uf.id_ed_uf INNER JOIN tbl_edicio_uf tbl_edicio_uf3 ON tbl_classe_uf.id_ed_uf=tbl_edicio_uf3.id_ed_uf INNER JOIN tbl_uf ON tbl_edicio_uf3.id_uf=tbl_uf.id_uf INNER JOIN tbl_modul ON tbl_uf.id_modul=tbl_modul.id_modul WHERE tbl_usuari.nom_usuari='$nom_usu' AND tbl_classe_uf.dia_classe='$diaActual' AND tbl_classe_uf.hora_ini_classe<'$horaActual' AND tbl_classe_uf.hora_fi_classe>'$horaActual'";
	//echo $queryUsu;

	$resultUsu = mysqli_query($conn,$queryUsu);
	$rowUsu = mysqli_fetch_array($resultUsu);
	if($rowUsu['nom_modul']=="" || $rowUsu['nom_aula']==""){
		echo "<br><br><p>".$nom_usu.", ahora no tienes ningúna clase.</p><br>";
	}else{
		echo "<br><br><p>Son les ".$horaActual.", ".$nom_usu." has d'estar a </p><p>".$rowUsu['nom_modul'].", aula ".$rowUsu['nom_aula'].".</p><br>";
	}
	
	
	?>
    	</div>
    </div>
    <br><br><br>
    <div style="margin-top: 200px; text-align: center;">
    	<button class="button1"><a href="">EL MEU HORARI</a></button>
    	<button class="button2"><a href="">GENERA CODI QR</a></button>
    	<button class="button3"><a href="profes_listas.php">LES MEVES LLISTES</a></button>
    </div>
	</div>

</body>
</html>