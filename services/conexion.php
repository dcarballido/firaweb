<?php
$conn = mysqli_connect('localhost','diego','qweQWE123','cronosproject');

if(mysqli_set_charset($conn, "utf8")){
	//echo "Conexión establecida<br>";
}else{
	echo "Ha fallado la conexión";
}
?>