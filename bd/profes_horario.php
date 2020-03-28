<!DOCTYPE html>
<html>
<head>
	<title>PROFES HORARIO</title>
	<link rel="stylesheet" type="text/css" href="../css/profesores.css">
	<meta charset="UTF-8">
	<style>
		table, th, td {
		  border: 1px solid black;
		  border-collapse: collapse;
		}
		th, td {
		  padding: 5px;
		  text-align: left;
		}
	</style>
</head>
<body>
	<?php
		//Mantengo la sesión. Por ende puedo utilizar la variable $_SESSION anteriormente configurada
		session_start();

		
		?>

		<ul>
	  <img class="logo" src="https://m.joan23.fje.edu/sites/all/themes/escuelas_fje_mobile/images/logo_bellvitge_fje.png">

	  <li style="float:right">
	  	
	  	<?php if(isset($_SESSION['codi_usuari'])){
			echo "<a href='../services/logout.proc.php' >Cerrar sesión de ".$_SESSION['nom']." ".$_SESSION['cognom1']." ".$_SESSION['cognom2']."</a>";
		}else{
			header("Location: ../login.php");
		} 
		?>
			
		</li>

    </ul>
    <hr>
  
<?php
  include '../services/conexion.php';
?>

  <table style="width:100%">
  <caption>Horari</caption>
  <tr>
  	<th></th>
    <th>Dilluns</th>
    <th>Dimarts</th>
    <th>Dimecres</th>
    <th>Dijous</th>
    <th>Divendres</th>
  </tr>

<?php

  $codiUsuari = $_SESSION['codi_usuari'];
  $arrayDias = array('Monday','Tuesday','Wednesday','Thursday','Friday');

  $arrayHorasIni = array('08:00:00','09:00:00','10:00:00','10:45:00','11:15:00','12:00:00','13:00:00','14:00:00','15:00:00','16:00:00','17:00:00','18:00:00','18:40:00','19:10:00','20:00:00');
  $arrayHorasFi = array('09:00:00','10:00:00','10:45:00','11:15:00','12:00:00','13:00:00','14:00:00','15:00:00','16:00:00','17:00:00','18:00:00','18:40:00','19:10:00','20:00:00','21:00:00');

for($i=0; $i < count($arrayHorasIni); $i++){
  echo "<tr><th>".$arrayHorasIni[$i]."-".$arrayHorasFi[$i]."</th>";
  for ($j=0; $j < count($arrayDias); $j++) { 
 
  $queryHorario = "SELECT * FROM tbl_tipus_usuari INNER JOIN tbl_usuari ON tbl_tipus_usuari.id_tipus_usuari=tbl_usuari.id_tipus_usuari INNER JOIN tbl_professor_ed_uf ON tbl_usuari.id_usuari=tbl_professor_ed_uf.id_usuari INNER JOIN tbl_edicio_uf ON tbl_professor_ed_uf.id_ed_uf=tbl_edicio_uf.id_ed_uf INNER JOIN tbl_aula ON tbl_edicio_uf.id_aula=tbl_aula.id_aula INNER JOIN tbl_edicio_uf tbl_edicio_uf2 ON tbl_aula.id_aula=tbl_edicio_uf2.id_aula INNER JOIN tbl_classe_uf ON tbl_edicio_uf2.id_ed_uf=tbl_classe_uf.id_ed_uf INNER JOIN tbl_edicio_uf tbl_edicio_uf3 ON tbl_classe_uf.id_ed_uf=tbl_edicio_uf3.id_ed_uf INNER JOIN tbl_uf ON tbl_edicio_uf3.id_uf=tbl_uf.id_uf INNER JOIN tbl_modul ON tbl_uf.id_modul=tbl_modul.id_modul INNER JOIN tbl_cicle ON tbl_modul.id_cicle=tbl_cicle.id_cicle WHERE tbl_usuari.codi_usuari='$codiUsuari' AND tbl_classe_uf.dia_classe='$arrayDias[$j]' AND tbl_classe_uf.hora_ini_classe='$arrayHorasIni[$i]' AND tbl_classe_uf.hora_fi_classe='$arrayHorasFi[$i]' GROUP BY tbl_classe_uf.id_classe ";

  $resultHorario = mysqli_query($conn,$queryHorario);


  if (!empty($resultHorario) && mysqli_num_rows($resultHorario)>0) {

      while ( $superRowHorario = mysqli_fetch_array($resultHorario) ){
          
             echo "<td>".$superRowHorario['codi_modul'].", ".$superRowHorario['aka_cicle'].", ".$superRowHorario['nom_aula']."</td>";
            
      }

  }else{ 
        if( $arrayHorasIni[$i]=="10:45:00" && $arrayHorasFi[$i]=="11:15:00" ){
          echo "<td>Esmorzar</td>";
        }elseif ( $arrayHorasIni[$i]=="14:00:00" && $arrayHorasFi[$i]=="15:00:00" ){
          echo "<td>Dinar</td>";
        }else{
          echo "<td>LIBRE</td>";
        }
  }
}
echo "</tr>"; 
}
?>

</table>

</body>
</html>