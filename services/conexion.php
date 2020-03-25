<?php
$conn = mysqli_connect('localhost','root','','cronosproject');
if($conn){
	//echo "Conexión establecida<br>";
}else{
	echo "Ha fallado la conexión";
}
?>