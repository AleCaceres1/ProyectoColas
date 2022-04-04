<!doctype html>
<jsp:include page="seguridad.jsp"></jsp:include>
<jsp:include page="aut2.jsp"></jsp:include>
<jsp:include page="aut3.jsp"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<title>Principal</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/principal.css" rel="stylesheet">
</head>
<body>
<div id="imagenes">    
<div id="wb_Image1" style="position:absolute;left:105px;top:144px;width:390px;height:291px;z-index:0;">
<a href="./CitaNom.jsp"><img src="images/Cita normal.png" id="Image1" alt=""></a></div>
<div id="wb_Image2" style="position:absolute;left:558px;top:118px;width:366px;height:343px;z-index:1;">
<a href="./CitaPro.jsp"><img src="images/Cita programada.png" id="Image2" alt=""></a></div>
<div id="wb_Text1" style="position:absolute;left:220px;top:401px;width:161px;height:33px;z-index:2;">
<span style="color:#000000;font-family:Arial;font-size:29px;">Cita Normal</span></div>
<div id="wb_Text2" style="position:absolute;left:635px;top:402px;width:212px;height:30px;z-index:3;">
<span style="color:#000000;font-family:Arial;font-size:27px;">Cita Programada</span></div>
<div id="wb_Text3" style="position:absolute;left:1037px;top:402px;width:308px;height:30px;z-index:4;">
<span style="color:#000000;font-family:Arial;font-size:27px;">Listado de Transacciones</span></div>
<div id="wb_Image3" style="position:absolute;left:875px;top:45px;width:633px;height:416px;z-index:5;">
<img src="images/COla2.png" id="Image3" alt=""></div>
</div>
<div id="wb_ResponsiveMenu1" style="position:absolute;left:0px;top:0px;width:1560px;height:79px;z-index:6;">
<label class="toggle" for="ResponsiveMenu1-submenu" id="ResponsiveMenu1-title">Menu<span id="ResponsiveMenu1-icon"><span>&nbsp;</span><span>&nbsp;</span><span>&nbsp;</span></span></label>
<input type="checkbox" id="ResponsiveMenu1-submenu">
<ul class="ResponsiveMenu1" id="ResponsiveMenu1" role="menu">
<li id="prin"><a role="menuitem" href="./principal.jsp"><i class="fa fa-home fa-2x">&nbsp;</i><br>Principal</a></li>
<li id="usua"><a role="menuitem" href="./Usuarios.jsp"><i class="fa fa-address-book-o fa-2x">&nbsp;</i><br>Usuarios</a></li>
<li>
<label for="ResponsiveMenu1-submenu-0" class="toggle"><i class="fa fa-university fa-2x">&nbsp;</i>Locales&nbsp;y&nbsp;Areas<b class="arrow-down"></b></label>
<a role="menuitem" href="javascript:void(0)" id="locareas"><i class="fa fa-university fa-2x">&nbsp;</i><br>Locales&nbsp;y&nbsp;Areas<b class="arrow-down"></b></a>
<input type="checkbox" id="ResponsiveMenu1-submenu-0">
<ul role="menu">
<li><a role="menuitem" href="./Locales.jsp">Locales</a></li>
<li><a role="menuitem" href="./Areas.jsp">Areas</a></li>
</ul>
</li>
<li id="sucgen"><a role="menuitem" href="./SucursalGerente.jsp"><i class="fa fa-sitemap fa-2x">&nbsp;</i><br>Mi&nbsp;Sucursal</a></li>
<li id="puesto"><a role="menuitem" href="./Puestos.jsp"><i class="fa fa-child fa-2x">&nbsp;</i><br>Puestos</a></li>
<li>
<label for="ResponsiveMenu1-submenu-1" class="toggle"><i class="fa fa-list-alt fa-2x">&nbsp;</i>Transacciones<b class="arrow-down"></b></label>
<a role="menuitem" href="javascript:void(0)" id="tran"><i class="fa fa-list-alt fa-2x">&nbsp;</i><br>Transacciones<b class="arrow-down"></b></a>
<input type="checkbox" id="ResponsiveMenu1-submenu-1">
<ul role="menu">
<li><a role="menuitem" href="./Transacciones.jsp">Transacciones</a></li>
<li><a role="menuitem" href="./TipoTransacciones.jsp">Tipos&nbsp;de&nbsp;Transacciones</a></li>
</ul>
</li>
<li id="bita"><a role="menuitem" href="./Bitacora.jsp"><i class="fa fa-table fa-2x">&nbsp;</i><br>Bitacora</a></li>
<li id="repor"><a role="menuitem" href="./Reporteria.jsp"><i class="fa fa-signal fa-2x">&nbsp;</i><br>Reporteria</a></li>
<li>
<label for="ResponsiveMenu1-submenu-2" class="toggle"><i class="fa fa-address-card-o fa-2x">&nbsp;</i>Citas<b class="arrow-down"></b></label>
<a role="menuitem" href="javascript:void(0)"><i class="fa fa-address-card-o fa-2x">&nbsp;</i><br>Citas<b class="arrow-down"></b></a>
<input type="checkbox" id="ResponsiveMenu1-submenu-2">
<ul role="menu">
<li><a role="menuitem" href="./CitaPro.jsp">Programadas</a></li>
<li><a role="menuitem" href="./CitaNom.jsp">Normal</a></li>
</ul>
</li>
<li name="sesion"><a role="menuitem" href="./index.jsp"><i class="fa fa-hand-o-down fa-2x">&nbsp;</i><br>Cerrar&nbsp;Sesion</a></li>
<li style="color: #ffffff;font-size: 15px; top: -15px;"><br>ID: <%out.print(session.getAttribute("s_usu") + " ");  %>
       <br>Rol: <%out.print(session.getAttribute("s_rol")); %>
       
</li>
<li id="aidloc" style="color: #ffffff;font-size: 15px; top: -15px; text-align: right;">
<br>
<br>&nbspID Local: <%out.print(session.getAttribute("s_loc"));%>
</li>
</ul>
</div>
<jsp:include page="ocultar.jsp"></jsp:include>   
</body>
</html>