<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<!doctype html>
<jsp:include page="procedimientos.jsp"/>
<html>
<head>
<meta charset="utf-8">
<title>Gestion de Usuarios</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="base/jquery-ui.min.css" rel="stylesheet">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/Usuarios.css" rel="stylesheet">
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
<link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
<link rel="stylesheet" href="css/modal.css">
<script src="js/Metodos.js"></script>
<script src="js/md5.js" type="text/javascript"></script>
<script>
        function modificarPASS(){
            
            var sinCifrar =document.getElementById('contra').value;           
            document.getElementById('contra').value=hex_md5(sinCifrar);                    
                      
        }
</script>
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
<div id="Tabs1" style="position:absolute;left:154px;top:140px;width:1218px;height:722px;z-index:99;">
<ul>
<li><a href="#tabs1-page-1"><span><i class="fa fa-plus-square tabs-icon"></i><br>Agregar</span></a></li>
<li><a href="#tabs1-page-2"><span><i class="fa fa-align-justify tabs-icon"></i><br>Listar</span></a></li>
<li><a href="#tabs1-page-3"><span><i class="fa fa-wrench tabs-icon"></i><br>Modificar</span></a></li>
<li><a href="#tabs1-page-4"><span><i class="fa fa-trash-o tabs-icon"></i><br>Eliminar</span></a></li>
</ul>
<div style="height:676px;" id="tabs1-page-1">
<div id="wb_Form1" style="position:absolute;left:103px;top:20px;width:722px;height:623px;z-index:19;">
<form name="F1" method="post" action="Usuarios.jsp">
<input type="text" id="Editbox1" style="position:absolute;left:269px;top:39px;width:339px;height:25px;z-index:0;" name="txt_id" value="" maxlength="15" spellcheck="false">
<label for="" id="Label1" style="position:absolute;left:60px;top:36px;width:202px;height:30px;line-height:30px;z-index:1;">Numero de Identidad:</label>
<label for="" id="Label2" style="position:absolute;left:85px;top:69px;width:195px;height:101px;line-height:41px;z-index:2;">Nombre Completo:</label>
<input type="text" id="Editbox2" style="position:absolute;left:270px;top:80px;width:414px;height:25px;z-index:3;" name="txt_nom" value="" maxlength="40" spellcheck="false">
<label for="" id="Label3" style="position:absolute;left:60px;top:118px;width:232px;height:29px;line-height:29px;z-index:4;">Fecha de Nacimiento: </label>
<input type="date" id="Editbox3" style="position:absolute;left:270px;top:123px;width:135px;height:25px;z-index:5;" name="txt_fecha" value="" spellcheck="false">
<label for="" id="Label4" style="position:absolute;left:157px;top:191px;width:88px;height:23px;line-height:23px;z-index:6;">Direccion: </label>
<label for="" id="Label5" style="position:absolute;left:165px;top:359px;width:72px;height:29px;line-height:29px;z-index:7;">Usuario:</label>
<input type="text" id="Editbox5" style="position:absolute;left:270px;top:366px;width:174px;height:25px;z-index:8;" name="txt_usu" value="" maxlength="15" spellcheck="false">
<label for="" id="Label6" style="position:absolute;left:136px;top:399px;width:109px;height:37px;line-height:37px;z-index:9;">Contraseña:</label>
<input type="text" id="contra" style="position:absolute;left:269px;top:410px;width:175px;height:25px;z-index:10;" name="txt_con" value="" maxlength="15" spellcheck="false">
<label for="" id="Label7" style="position:absolute;left:199px;top:457px;width:38px;height:35px;line-height:35px;z-index:11;">Rol: </label>
<select name="cb_rol" size="1" id="Combobox1" style="position:absolute;left:270px;top:464px;width:160px;height:28px;z-index:12;">
<option>Administrador</option>
<option>Gerente</option>
<option>Empleado</option>
</select>
<input type="submit" id="Button1" name="btn_crearusu" value="Crear Usuario" style="position:absolute;left:323px;top:521px;width:124px;height:35px;z-index:13;" onclick="modificarPASS()">
<textarea name="txt_dir" id="TextArea1" style="position:absolute;left:270px;top:164px;width:410px;height:71px;z-index:14;" rows="4" cols="49" maxlength="150" spellcheck="false"></textarea>
<label for="" id="Label8" style="position:absolute;left:165px;top:263px;width:88px;height:23px;line-height:23px;z-index:15;">Telefono: </label>
<input type="text" id="Editbox4" style="position:absolute;left:270px;top:264px;width:216px;height:25px;z-index:16;" name="txt_tel" value="" maxlength="10" spellcheck="false">
<label for="" id="Label9" style="position:absolute;left:175px;top:311px;width:70px;height:23px;line-height:23px;z-index:17;">Correo:</label>
<input type="text" id="Editbox7" style="position:absolute;left:270px;top:316px;width:321px;height:25px;z-index:18;" name="txt_email" value="" maxlength="30" spellcheck="false">
</form>
</div>
</div>
<div style="height:676px;" id="tabs1-page-2">
<!-- Static Table Start -->
        <div class="data-table-area mg-tb-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sparkline13-list">
                            <div class="sparkline13-hd">
                                <div class="main-sparkline13-hd">
                                    <Center><h1>Lista de Usuarios</h1></center>
                                </div>
                            </div>

                            <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                   data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>

                                        <th data-field="id">IDENTIDAD</th>
                                        <th data-field="usuario" data-editable="false">USUARIO</th>
                                        <th data-field="pass" data-editable="false">CONTRASEÑA</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="fecha" data-editable="false">FECHA NACIMIENTO</th>
                                        <th data-field="direccion" data-editable="false">DIRECCION</th>
                                        <th data-field="telefono" data-editable="false">TELEFONO</th>
                                        <th data-field="correo" data-editable="false">CORREO</th>
                                        <th data-field="rol" data-editable="false">ROL</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <% 
                                        //Cargar datos a la tabla usuarios
                                        Dba db = new Dba();
                                        db.Conectar();
                                        db.query.execute("select * from usuarios");
                                        ResultSet rs = db.query.getResultSet();
                                        Date fecha;
                                        String id, usuario, pass, nombre, direccion, telefono, correo, rol;
                                        
                                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                        String fecha_usu;
                                        
                                        
                                        while (rs.next()) {

                                            id = rs.getString(1);
                                            usuario = rs.getString(2);
                                            pass = rs.getString(3);
                                            nombre = rs.getString(4);
                                            fecha = rs.getDate(5);
                                            direccion = rs.getString(6);
                                            telefono = rs.getString(7);
                                            correo = rs.getString(8);
                                            rol = rs.getString(9);
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=usuario%></td>
                                        <td><%=pass%></td>
                                        <td><%=nombre%></td>
                                        <td><%=fecha%></td>
                                        <td><%=direccion%></td>
                                        <td><%=telefono%></td>
                                        <td><%=correo%></td>
                                        <td><%=rol%></td>
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
</div>
<div style="height:676px;" id="tabs1-page-3">
<Center><h1>Modificar Usuarios</h1></center>
    <div id="myModal" class="modal">  
  <div class="modal-content" style="height: 90%;width: 50%;">
    <span class="close">CERRAR</span>
         <script>
        var cerrar = document.getElementsByClassName("close")[0];
        
        cerrar.onclick = function() {
          modal.style.display = "none";
        } 
        </script> 
    <p> <div id="wb_Form1" style="position:absolute;left:10px;top:10px;width:550px;height:418px;z-index:23;">
<form name="fM2" action="Usuarios.jsp" method="POST">
        <input type="text" id="id" style="position:absolute;left:269px;top:39px;width:339px;height:25px;z-index:0;" name="txt_mid" value="" maxlength="15" spellcheck="false">
            <label for="" id="Label1" style="position:absolute;left:60px;top:36px;width:202px;height:70px;line-height:30px;z-index:1;">Numero de Identidad:</label>
        <input type="text" id="nom" style="position:absolute;left:270px;top:80px;width:414px;height:25px;z-index:3;" name="txt_mnom" value="" maxlength="40" spellcheck="false">    
            <label for="" id="Label2" style="position:absolute;left:85px;top:69px;width:180px;height:41px;line-height:41px;z-index:2;">Nombre Completo:</label>
            <input type="date" min="1920-01-01" id="fecha" style="position:absolute;left:270px;top:123px;width:135px;height:16px;z-index:5;" name="txt_mfecha" value="" spellcheck="false">
            <label for="" id="Label3" style="position:absolute;left:60px;top:118px;width:232px;height:29px;line-height:29px;z-index:4;">Fecha de Nacimiento: </label>
        <textarea name="txt_mdir" id="dir" style="position:absolute;left:270px;top:164px;width:410px;height:71px;z-index:14;" rows="4" cols="49" maxlength="150" spellcheck="false"></textarea>
            <label for="" id="Label4" style="position:absolute;left:157px;top:191px;width:88px;height:23px;line-height:23px;z-index:6;">Direccion: </label>
        <input type="text" id="tel" style="position:absolute;left:270px;top:264px;width:216px;height:25px;z-index:16;" name="txt_mtel" value="" maxlength="10" spellcheck="false">
            <label for="" id="Label8" style="position:absolute;left:165px;top:263px;width:88px;height:23px;line-height:23px;z-index:15;">Telefono: </label>
        <input type="text" id="email" style="position:absolute;left:270px;top:316px;width:321px;height:25px;z-index:18;" name="txt_memail" value="" maxlength="30" spellcheck="false">    
            <label for="" id="Label9" style="position:absolute;left:175px;top:311px;width:70px;height:23px;line-height:23px;z-index:17;">Correo:</label>
        <input type="text" id="usu" style="position:absolute;left:270px;top:366px;width:174px;height:25px;z-index:8;" name="txt_musu" value="" maxlength="15" spellcheck="false">    
            <label for="" id="Label5" style="position:absolute;left:165px;top:359px;width:72px;height:29px;line-height:29px;z-index:7;">Usuario:</label>
        <input type="text" id="con" style="position:absolute;left:269px;top:410px;width:175px;height:25px;z-index:10;" name="txt_mcon" value="" spellcheck="false">   
            <label for="" id="Label6" style="position:absolute;left:136px;top:399px;width:109px;height:37px;line-height:37px;z-index:9;">Contraseña:</label>
            <select name="cb_mrol" size="1" id="rol" style="position:absolute;left:270px;top:464px;width:160px;height:28px;z-index:12;">
                <option>Admin</option>
                <option>Gerente</option>
                <option>Empleado</option>
                <option>Cliente</option>
            </select>
            <label for="" id="Label7" style="position:absolute;left:199px;top:457px;width:38px;height:35px;line-height:35px;z-index:11;">Rol: </label>
            <input type="submit" value="Modificar Usuario" name="btn_modusu" style="position:absolute;left:520px;top:390px;width:170px;height:48px;z-index:20;">
</form>
</div>
    </p>
  </div>
</div>
    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                   data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>

                                        <th data-field="id">IDENTIDAD</th>
                                        <th data-field="usuario" data-editable="false">USUARIO</th>
                                        <th data-field="pass" data-editable="false">CONTRASEÑA</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="fecha" data-editable="false">FECHA NACIMIENTO</th>
                                        <th data-field="direccion" data-editable="false">DIRECCION</th>
                                        <th data-field="telefono" data-editable="false">TELEFONO</th>
                                        <th data-field="correo" data-editable="false">CORREO</th>
                                        <th data-field="rol" data-editable="false">ROL</th>
                                        <th data-field="operacion" data-editable="false">OPERACIÓN</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <% 
                                        //Cargar datos a la tabla usuarios
                                        
                                        db.Conectar();
                                        db.query.execute("select * from usuarios");
                                        ResultSet mon = db.query.getResultSet();
                                        

                                                                        
                                        while (mon.next()) {

                                            id = mon.getString(1);
                                            usuario = mon.getString(2);
                                            pass = mon.getString(3);
                                            nombre = mon.getString(4);
                                            fecha = mon.getDate(5);
                                            direccion = mon.getString(6);
                                            telefono = mon.getString(7);
                                            correo = mon.getString(8);
                                            rol = mon.getString(9);
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=usuario%></td>
                                        <td><%=pass%></td>
                                        <td><%=nombre%></td>
                                        <td><%=fecha%></td>
                                        <td><%=direccion%></td>
                                        <td><%=telefono%></td>
                                        <td><%=correo%></td>
                                        <td><%=rol%></td>
                                        <td><input type="button" value="Modificar" 
                                                    onclick="mod('<%=id%>','<%=nombre%>','<%=fecha%>','<%=direccion%>','<%=telefono%>','<%=correo%>','<%=usuario%>','<%=pass%>','<%=rol%>')"/></td>
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>    
    
</div>
<div style="height:676px;" id="tabs1-page-4">
<Center><h1>Eliminar Usuarios</h1></center>
    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                   data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>
                                        <th data-field="id">IDENTIDAD</th>
                                        <th data-field="usuario" data-editable="false">USUARIO</th>
                                        <th data-field="pass" data-editable="false">CONTRASEÑA</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="fecha" data-editable="false">FECHA NACIMIENTO</th>
                                        <th data-field="direccion" data-editable="false">DIRECCION</th>
                                        <th data-field="telefono" data-editable="false">TELEFONO</th>
                                        <th data-field="correo" data-editable="false">CORREO</th>
                                        <th data-field="rol" data-editable="false">ROL</th>
                                        <th data-field="operacion" data-editable="false">OPERACIÓN</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <% 
                                        //Cargar datos a la tabla usuarios
                                        
                                        db.Conectar();
                                        db.query.execute("select * from usuarios");
                                        ResultSet eli = db.query.getResultSet();
                                                                        
                                        while (eli.next()) {

                                            id = eli.getString(1);
                                            usuario = eli.getString(2);
                                            pass = eli.getString(3);
                                            nombre = eli.getString(4);
                                            fecha = eli.getDate(5);
                                            direccion = eli.getString(6);
                                            telefono = eli.getString(7);
                                            correo = eli.getString(8);
                                            rol = eli.getString(9);
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=usuario%></td>
                                        <td><%=pass%></td>
                                        <td><%=nombre%></td>
                                        <td><%=fecha%></td>
                                        <td><%=direccion%></td>
                                        <td><%=telefono%></td>
                                        <td><%=correo%></td>
                                        <td><%=rol%></td>
                                        <td><input type="button" value="Eliminar" 
                                                    onclick="window.location='Usuarios.jsp?p_id=<%=id%>&eli_usu=1'"/></td>
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>     
    
</div>
</div>
<div id="wb_ResponsiveMenu1" style="position:absolute;left:0px;top:0px;width:1560px;height:79px;z-index:100;">
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
<br><br>&nbspID Local: <%out.print(session.getAttribute("s_loc"));%>
</li>
</ul>
</div>
                                
                                        <!-- bootstrap JS
                    ============================================ -->
        <jsp:include page="ocultar.jsp"></jsp:include> 
        <script src="js/bootstrap.min.js"></script>                              
        <!-- data table JS
                    ============================================ -->
        <script src="js/data-table/bootstrap-table.js"></script>
        <script src="js/modal.js"></script>
        <script src="js/data-table/tableExport.js"></script>
        <script src="js/data-table/data-table-active.js"></script>
        <script src="js/data-table/bootstrap-table-editable.js"></script>
        <script src="js/data-table/bootstrap-editable.js"></script>
        <script src="js/data-table/bootstrap-table-resizable.js"></script>
        <script src="js/data-table/colResizable-1.5.source.js"></script>
        <script src="js/data-table/bootstrap-table-export.js"></script>

        <!-- tab JS
                    ============================================ -->
        <script src="js/tab.js"></script>                                   
                               
</body>
</html>