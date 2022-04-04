<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Tipo de Transacciones</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="base/jquery-ui.min.css" rel="stylesheet">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/TipoTransacciones.css" rel="stylesheet">
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script>
$(document).ready(function()
{
   $("#Tabs1").tabs(
   {
      show: false,
      hide: false,
      event: 'click',
      collapsible: false
   });
});
</script>
</head>
<body>
<div id="Tabs1" style="position:absolute;left:299px;top:88px;width:957px;height:632px;z-index:7;">
<ul>
<li><a href="#tabs1-page-1"><span><i class="fa fa-plus-square tabs-icon"></i><br>Agregar</span></a></li>
<li><a href="#tabs1-page-2"><span><i class="fa fa-align-justify tabs-icon"></i><br>Listar</span></a></li>
<li><a href="#tabs1-page-3"><span><i class="fa fa-wrench tabs-icon"></i><br>Modificar</span></a></li>
<li><a href="#tabs1-page-4"><span><i class="fa fa-trash-o tabs-icon"></i><br>Eliminar</span></a></li>
</ul>
<div style="height:586px;" id="tabs1-page-1">
<div id="wb_Form1" style="position:absolute;left:209px;top:30px;width:539px;height:200px;z-index:3;">
<form name="F1" method="post" action="usuarios.jsp" enctype="multipart/form-data" id="Form1">
<input type="submit" id="Button1" name="btn_crear" value="Crear Transaccion" style="position:absolute;left:198px;top:127px;width:142px;height:35px;z-index:0;">
<input type="text" id="Editbox7" style="position:absolute;left:236px;top:66px;width:254px;height:16px;z-index:1;" name="txt_areaid" value="" disabled spellcheck="false">
<label for="" id="Label7" style="position:absolute;left:39px;top:61px;width:204px;height:28px;line-height:28px;z-index:2;">Tipo de transaccion:</label>
</form>
</div>
</div>
<div style="height:586px;" id="tabs1-page-2">
</div>
<div style="height:586px;" id="tabs1-page-3">
</div>
<div style="height:586px;" id="tabs1-page-4">
</div>
</div>
<div id="wb_ResponsiveMenu1" style="position:absolute;left:2px;top:0px;width:1560px;height:79px;z-index:8;">
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
<br><br>ID Local: <%out.print(session.getAttribute("s_loc"));%>
</li>
</ul>
</div>
       <jsp:include page="ocultar.jsp"></jsp:include>
</body>
</html>