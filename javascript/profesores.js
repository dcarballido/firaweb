window.onload = consultar;


function objetoAjax(){
	var xmlhttp=false;
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
	  xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function consultar(){
	divResultado = document.getElementById('resultado');
	var ajax2=objetoAjax();
	ajax2.open("POST", "../services/profes_lista_consulta.php", true);alert("Ey");
	ajax2.onreadystatechange=function() {
		if (ajax2.readyState==4 && ajax2.status==200) {
			var respuesta2=JSON.parse(this.responseText);
			//var respuesta2=ajax2.responseText;
			//utf8_encode(respuesta2);
			//var respuesta2=eval("("+ajax2.responseText+")");
			
			var tabla =  '<table style="color:#000099;padding: 10px 20%;width:100%;"><tr style="background:#9BB;"><td>CICLE</td></tr>';
			for(var i=0;i<respuesta2.length;i++) {
				tabla +='<tr><td>'+respuesta2[i].nom_cicle+'</td></tr>';
				
				
			}
			tabla+='</table>';
			divResultado.innerHTML=tabla;
		}
		
		
	}
	
	ajax2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		ajax2.send();
}

