<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="index.css" rel="stylesheet">
<script src="js/md5.js" type="text/javascript"></script>
<script>
        function modificarPASS(){
            
            var sinCifrar =document.getElementById('password').value;           
            document.getElementById('password').value=hex_md5(sinCifrar);                    
                      
        }
    </script>

</head>
<body>
<div id="container">
<div id="wb_Form1" style="position:absolute;left:211px;top:43px;width:546px;height:282px;z-index:7;">
    <form name="F1" method="post" action="autenticacion.jsp">
        <input type="text" id="Editbox1" style="position:absolute;left:260px;top:58px;width:111px;height:23px;z-index:0;" name="txt_usu" spellcheck="false">
            <label id="Label1" style="position:absolute;left:159px;top:55px;width:79px;height:30px;line-height:30px;z-index:2;">Usuario: </label>
        <input type="password" id="password" style="position:absolute;left:260px;top:109px;width:111px;height:23px;z-index:1;" name="txt_con" spellcheck="false">
            <label for="" id="Label2" style="position:absolute;left:121px;top:106px;width:117px;height:30px;line-height:30px;z-index:3;">Contraseña:</label>
            <input type="submit" id="Button1" name="btn_login" value="Iniciar Sesion" style="position:absolute;left:209px;top:219px;width:129px;height:44px;z-index:4;" onclick="modificarPASS();">
<label for="" id="Label3" style="position:absolute;left:44px;top:167px;width:295px;height:20px;line-height:20px;z-index:5;">Eres cliente?</label>
<div id="wb_Text1" style="position:absolute;left:360px;top:172px;width:116px;height:18px;z-index:6;">
<span style="color:#000000;font-family:Arial;font-size:16px;"><a href="Reg_Clientes.jsp">Registrate Aquí</a></span></div>
</form>
</div>
</div>
</body>
</html>