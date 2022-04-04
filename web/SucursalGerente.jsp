<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<!doctype html>
<jsp:include page="procedimientos.jsp"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<title>Mi Sucursal</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="base/jquery-ui.min.css" rel="stylesheet">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/SucursalGerente.css" rel="stylesheet">
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/Metodos.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
<link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
<link rel="stylesheet" href="css/modal.css">

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
<div id="wb_ResponsiveMenu1" style="position:absolute;left:0px;top:0px;width:1560px;height:79px;z-index:1;">
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
<div id="Tabs1" style="position:absolute;left:297px;top:110px;width:957px;height:764px;z-index:0;">
<ul>
<li><a href="#tabs1-page-1"><span><i class="fa fa-etsy tabs-icon"></i><br>Empleados</span></a></li>
<li><a href="#tabs1-page-3"><span><i class="fa fa-wrench tabs-icon"></i><br>Modificar</span></a></li>
<li><a href="#tabs1-page-5"><span><i class="fa fa-id-card-o tabs-icon"></i><br>Puestos</span></a></li>
</ul>
<div style="height:718px;" id="tabs1-page-1">
<div id="wb_Form3" style="position:absolute;left:201px;top:16px;width:579px;height:268px;z-index:11;">
<form name="Form2" method="post" action="SucursalGerente.jsp">
<label for="" id="Label2" style="position:absolute;left:109px;top:66px;width:81px;height:26px;line-height:26px;z-index:0;">Nombre: </label>
<label for="" id="Label3" style="position:absolute;left:132px;top:111px;width:58px;height:23px;line-height:23px;z-index:1;">Local: </label>
<input type="submit" id="Button6" name="btn_areaempgen" value="Asignar Empleado" style="position:absolute;left:208px;top:214px;width:150px;height:35px;z-index:2;">
<label for="" id="Label9" style="position:absolute;left:155px;top:19px;width:283px;height:24px;line-height:24px;z-index:3;">Registrar Empleado en Area</label>
<input type="text" id="nomemp" style="position:absolute;left:203px;top:70px;width:245px;height:25px;z-index:4;" name="txt_sempnom" value="" spellcheck="false">
<input type="hidden" id="idemp" style="position:absolute;left:405px;top:70px;width:68px;height:16px;z-index:5;" name="txt_sempid" value="" spellcheck="false">
<input type="text" id="nomlocemp" style="position:absolute;left:206px;top:116px;width:172px;height:25px;z-index:6;" name="txt_semplocnom" value="" spellcheck="false">
<input type="hidden" id="idlocemp" style="position:absolute;left:408px;top:116px;width:65px;height:16px;z-index:7;" name="txt_semplocid" value="" spellcheck="false">
<label for="" id="Label4" style="position:absolute;left:132px;top:157px;width:46px;height:23px;line-height:23px;z-index:8;">Area:</label>
<input type="text" id="areanom" style="position:absolute;left:208px;top:159px;width:170px;height:25px;z-index:9;" name="txt_semparea" value="" spellcheck="false">
<input type="hidden" id="areaid" style="position:absolute;left:405px;top:159px;width:65px;height:16px;z-index:10;" name="txt_sareaid" value="" spellcheck="false">
</form>
</div>
    <input type="submit" id="Button7" name="btn_semple" value="Añadir Empleado" style="position:absolute;left:310px;top:307px;width:150px;height:35px;z-index:12;" onclick="locareaemp()">
    <input type="submit" id="Button5" name="btn_semparea" value="Añadir Area" style="position:absolute;left:522px;top:307px;width:150px;height:35px;z-index:13;" onclick="areaemp()">
<div id="myModal10" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close">CERRAR</span>
         <script>
        var modal10 = document.getElementById("myModal10");      
        var cerrar = document.getElementsByClassName("close")[0];
        
        cerrar.onclick = function() {
          modal10.style.display = "none";
        } 
        </script>
        <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="idlocal">ID LOCAL</th>
                                        <th data-field="nombrelocal" data-editable="false">NOMBRE LOCAL</th>
                                        <th data-field="idusuario">ID USUARIO</th>
                                        <th data-field="nombreusuario" data-editable="false">NOMBRE USUARIO</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        Dba db= new Dba();
                                        db.Conectar();
                                        db.query.execute("select Empleado_Local.id_local, locales.loc_nom, Empleado_Local.identidad, usuarios.nombre "
                                        + "FROM Empleado_Local "
                                        + "INNER JOIN locales ON "
                                        + "Empleado_Local.id_local = locales.id_local "
                                        + "INNER JOIN usuarios ON "
                                        + "Empleado_Local.identidad = usuarios.identidad "
                                        + "WHERE Empleado_Local.id_local = "+session.getAttribute("s_loc")+"");
                                        ResultSet empleados = db.query.getResultSet();
                                        
                                        int locempid;                                        
                                        String emplocnom,empid,empnom;
                                        
                                        while (empleados.next()) {

                                            locempid = Integer.parseInt(empleados.getString(1));
                                            emplocnom = empleados.getString(2);
                                            empid = empleados.getString(3);
                                            empnom = empleados.getString(4);
                                    %>
                                    <tr>
                                        <td><%=locempid%></td>
                                        <td><%=emplocnom%></td>
                                        <td><%=empid%></td>
                                        <td><%=empnom%></td>
                                        <td><input type="button" value="Elección" 
                                        onclick="locareadatosgen('<%=locempid%>','<%=emplocnom%>','<%=empid%>','<%=empnom%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
                
  </div>
</div>
<div id="myModal11" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close1">CERRAR</span>
         <script>
        var modal11 = document.getElementById("myModal11");      
        var cerrar = document.getElementsByClassName("close1")[0];
        
        cerrar.onclick = function() {
          modal11.style.display = "none";
        } 
        </script>
         <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="idlocal">ID AREA</th>
                                        <th data-field="nombrelocal" data-editable="false">NOMBRE AREA</th>
                                        <th data-field="idusuario">ID LOCAL</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        
                                      //  int aidil = Integer.parseInt(request.getParameter("txt_emplocid"));
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select area.id_area, area.nombre, locales.id_local "
                                                + "FROM area "
                                                + "INNER JOIN locales ON "
                                                + "area.id_local = locales.id_local "
                                                + "WHERE area.id_local = "+session.getAttribute("s_loc")+"");
                                        ResultSet are = db.query.getResultSet();
                                        
                                        
                                        int ida,idl;
                                        String anom;
                                        while (are.next()) {

                                            ida = Integer.parseInt(are.getString(1));
                                            anom = are.getString(2);
                                            idl = Integer.parseInt(are.getString(3));
                                            
                                    %>
                                    <tr>
                                        <td><%=ida%></td>
                                        <td><%=anom%></td>
                                        <td><%=idl%></td>
                                       
                                        <td><input type="button" value="Elección" 
                                        onclick="areadatosgen('<%=ida%>','<%=anom%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
                
  </div>
</div>
<div style="position:absolute;top:350px;left:30px;width: 900px">
     <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="identidad">IDENTIDAD</th>
                                        <th data-field="nombreusu">NOMBRE</th>
                                        <th data-field="idloc" data-editable="false">ID LOCAL</th>
                                        <th data-field="locnom">NOMBRE LOCAL</th>
                                        <th data-field="idarea" data-editable="false">ID AREA</th>
                                        <th data-field="nomarea" data-editable="false">NOMBRE AREA</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                        
                                        db.query.execute("SELECT Empleado_Area.identidad, usuarios.nombre, "
                                                        + "Empleado_Area.id_local, locales.loc_nom, "
                                                        + "Empleado_Area.id_area, area.nombre "                                               
                                                        + "FROM Empleado_Area "
                                                        + "INNER JOIN locales ON "
                                                        + "Empleado_Area.id_local = locales.id_local "
                                                        + "INNER JOIN usuarios ON "
                                                        + "Empleado_Area.identidad = usuarios.identidad "
                                                        + "INNER JOIN area ON "
                                                        + "Empleado_Area.id_area = area.id_area "
                                                        + "WHERE Empleado_Area.id_local = "+session.getAttribute("s_loc")+"");
                                        ResultSet emparea = db.query.getResultSet();
                                        
                                        int aidil,ailoc;
                                        String iden , nomloc ,nomare ,nomusu;
                                        
                                        while (emparea.next()) {
                                            iden = emparea.getString(1);
                                            nomusu = emparea.getString(2);
                                            ailoc = Integer.parseInt(emparea.getString(3));
                                            nomloc = emparea.getString(4);
                                            aidil = Integer.parseInt(emparea.getString(5));
                                            nomare = emparea.getString(6);
                                            
                                    %>
                                    <tr>
                                        <td><%=iden%></td>
                                        <td><%=nomusu%></td>
                                        <td><%=ailoc%></td>
                                        <td><%=nomloc%></td>
                                        <td><%=aidil%></td>
                                        <td><%=nomare%></td>
                                        <td><input type="button" value="Eliminar" 
                                                    onclick="window.location='SucursalGerente.jsp?emp_id=<%=iden%>&idloc=<%=ailoc%>&idare=<%=aidil%>&eli_emparea=1'"/></td>
                                      </tr>
                                    <%  }%>
                                </tbody>
      </table>
     </div>
</div>

                                
<div style="height:718px;" id="tabs1-page-3">
<div id="wb_Form3" style="position:absolute;left:201px;top:16px;width:579px;height:268px;z-index:11;">
<form name="Form2" method="post" action="SucursalGerente.jsp">
<label for="" id="Label2" style="position:absolute;left:109px;top:66px;width:81px;height:26px;line-height:26px;z-index:0;">Nombre: </label>
<label for="" id="Label3" style="position:absolute;left:132px;top:111px;width:58px;height:23px;line-height:23px;z-index:1;">Local: </label>
<input type="submit" id="Button6" name="btn_mareaempgen" value="Asignar Empleado" style="position:absolute;left:208px;top:214px;width:150px;height:35px;z-index:2;">
<label for="" id="Label9" style="position:absolute;left:155px;top:19px;width:283px;height:24px;line-height:24px;z-index:3;">Modificar Empleado en Area</label>
<input type="text" id="mnomemp" style="position:absolute;left:203px;top:70px;width:245px;height:25px;z-index:4;" name="txt_msempnom" value="" spellcheck="false">
<input type="hidden" id="midemp" style="position:absolute;left:405px;top:70px;width:68px;height:16px;z-index:5;" name="txt_msempid" value="" spellcheck="false">
<input type="text" id="mnomlocemp" style="position:absolute;left:206px;top:116px;width:172px;height:25px;z-index:6;" name="txt_msemplocnom" value="" spellcheck="false">
<input type="hidden" id="midlocemp" style="position:absolute;left:408px;top:116px;width:65px;height:16px;z-index:7;" name="txt_msemplocid" value="" spellcheck="false">
<label for="" id="Label4" style="position:absolute;left:132px;top:157px;width:46px;height:23px;line-height:23px;z-index:8;">Area:</label>
<input type="text" id="mareanom" style="position:absolute;left:208px;top:159px;width:170px;height:25px;z-index:9;" name="txt_msemparea" value="" spellcheck="false">
<input type="hidden" id="mareaid" style="position:absolute;left:405px;top:159px;width:65px;height:16px;z-index:10;" name="txt_msareaid" value="" spellcheck="false">
</form>
</div>
    <input type="submit" id="Button7" name="btn_msemple" value="Añadir Empleado" style="position:absolute;left:310px;top:307px;width:150px;height:35px;z-index:12;" onclick="mlocareaemp()">
    <input type="submit" id="Button5" name="btn_msemparea" value="Añadir Area" style="position:absolute;left:522px;top:307px;width:150px;height:35px;z-index:13;" onclick="mareaemp()">
<div id="myModal12" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close2">CERRAR</span>
         <script>
        var modal12 = document.getElementById("myModal12");      
        var cerrar = document.getElementsByClassName("close2")[0];
        
        cerrar.onclick = function() {
          modal12.style.display = "none";
        } 
        </script>
        <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="idlocal">ID LOCAL</th>
                                        <th data-field="nombrelocal" data-editable="false">NOMBRE LOCAL</th>
                                        <th data-field="idusuario">ID USUARIO</th>
                                        <th data-field="nombreusuario" data-editable="false">NOMBRE USUARIO</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 

                                        db.query.execute("select Empleado_Local.id_local, locales.loc_nom, Empleado_Local.identidad, usuarios.nombre "
                                        + "FROM Empleado_Local "
                                        + "INNER JOIN locales ON "
                                        + "Empleado_Local.id_local = locales.id_local "
                                        + "INNER JOIN usuarios ON "
                                        + "Empleado_Local.identidad = usuarios.identidad "
                                        + "WHERE Empleado_Local.id_local = "+session.getAttribute("s_loc")+"");
                                        ResultSet mempleados = db.query.getResultSet();
                                        
                                        int mlocempid;                                        
                                        String memplocnom,mempid,mempnom;
                                        
                                        while (mempleados.next()) {

                                            mlocempid = Integer.parseInt(mempleados.getString(1));
                                            memplocnom = mempleados.getString(2);
                                            mempid = mempleados.getString(3);
                                            mempnom = mempleados.getString(4);
                                    %>
                                    <tr>
                                        <td><%=mlocempid%></td>
                                        <td><%=memplocnom%></td>
                                        <td><%=mempid%></td>
                                        <td><%=mempnom%></td>
                                        <td><input type="button" value="Elección" 
                                        onclick="mlocareadatosgen('<%=mlocempid%>','<%=memplocnom%>','<%=mempid%>','<%=mempnom%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
                
  </div>
</div>
<div id="myModal13" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close3">CERRAR</span>
         <script>
        var modal13 = document.getElementById("myModal13");      
        var cerrar = document.getElementsByClassName("close3")[0];
        
        cerrar.onclick = function() {
          modal13.style.display = "none";
        } 
        </script>
         <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="idlocal">ID AREA</th>
                                        <th data-field="nombrelocal" data-editable="false">NOMBRE AREA</th>
                                        <th data-field="idusuario">ID LOCAL</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        
                                      //  int aidil = Integer.parseInt(request.getParameter("txt_emplocid"));
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select area.id_area, area.nombre, locales.id_local "
                                                + "FROM area "
                                                + "INNER JOIN locales ON "
                                                + "area.id_local = locales.id_local "
                                                + "WHERE area.id_local = "+session.getAttribute("s_loc")+"");
                                        ResultSet mare = db.query.getResultSet();
                                        
                                        
                                        int mida,midl;
                                        String manom;
                                        while (mare.next()) {

                                            mida = Integer.parseInt(mare.getString(1));
                                            manom = mare.getString(2);
                                            midl = Integer.parseInt(mare.getString(3));
                                            
                                    %>
                                    <tr>
                                        <td><%=mida%></td>
                                        <td><%=manom%></td>
                                        <td><%=midl%></td>
                                       
                                        <td><input type="button" value="Elección" 
                                        onclick="mareadatosgen('<%=mida%>','<%=manom%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
                
  </div>
</div>
<div style="position:absolute;top:350px;left:30px;width: 900px">
     <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="identidad">IDENTIDAD</th>
                                        <th data-field="nombreusu">NOMBRE</th>
                                        <th data-field="idloc" data-editable="false">ID LOCAL</th>
                                        <th data-field="locnom">NOMBRE LOCAL</th>
                                        <th data-field="idarea" data-editable="false">ID AREA</th>
                                        <th data-field="nomarea" data-editable="false">NOMBRE AREA</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                        
                                        db.query.execute("SELECT Empleado_Area.identidad, usuarios.nombre, "
                                                        + "Empleado_Area.id_local, locales.loc_nom, "
                                                        + "Empleado_Area.id_area, area.nombre "                                               
                                                        + "FROM Empleado_Area "
                                                        + "INNER JOIN locales ON "
                                                        + "Empleado_Area.id_local = locales.id_local "
                                                        + "INNER JOIN usuarios ON "
                                                        + "Empleado_Area.identidad = usuarios.identidad "
                                                        + "INNER JOIN area ON "
                                                        + "Empleado_Area.id_area = area.id_area "
                                                        + "WHERE Empleado_Area.id_local = "+session.getAttribute("s_loc")+"");
                                        ResultSet memparea = db.query.getResultSet();
                                        
                                        int maidil,mailoc;
                                        String miden , mnomloc ,mnomare ,mnomusu;
                                        
                                        while (memparea.next()) {
                                            miden = memparea.getString(1);
                                            mnomusu = memparea.getString(2);
                                            mailoc = Integer.parseInt(memparea.getString(3));
                                            mnomloc = memparea.getString(4);
                                            maidil = Integer.parseInt(memparea.getString(5));
                                            mnomare = memparea.getString(6);
                                            
                                    %>
                                    <tr>
                                        <td><%=miden%></td>
                                        <td><%=mnomusu%></td>
                                        <td><%=mailoc%></td>
                                        <td><%=mnomloc%></td>
                                        <td><%=maidil%></td>
                                        <td><%=mnomare%></td>
                                        <td><input type="button" value="Elección" 
                                        onclick="memparead('<%=miden%>','<%=mnomusu%>','<%=mailoc%>','<%=mnomloc%>','<%=maidil%>','<%=mnomare%>')"/></td>   
                                      </tr>
                                    <%  }%>
                                </tbody>
      </table>
     </div>
</div>
                                
                                
<div style="height:718px;" id="tabs1-page-5">
<div id="wb_Form2" style="position:absolute;left:279px;top:41px;width:498px;height:253px;z-index:34;">
<form name="Form2" method="post" action="SucursalGerente.jsp">
<div id="wb_Text1" style="position:absolute;left:125px;top:30px;width:148px;height:27px;z-index:28;">
<span style="color:#000000;font-family:Arial;font-size:24px;"><em>Crear Puesto</em></span></div>
    <label for="" id="Label8" style="position:absolute;left:63px;top:77px;width:82px;height:24px;line-height:24px;z-index:29;">Nombre: </label>
<input type="text" id="Editbox13" style="position:absolute;left:153px;top:80px;width:204px;height:25px;z-index:30;" name="txt_puesnom" value="" spellcheck="false">

<input type="text" id="pnomarea" style="position:absolute;left:153px;top:110px;width:170px;height:25px;z-index:9;" name="txt_pnomarea" value="" spellcheck="false">
<input type="hidden" id="pidarea" style="position:absolute;left:405px;top:159px;width:65px;height:16px;z-index:10;" name="txt_pidarea" value="" spellcheck="false">
    <label for="" id="Label4" style="position:absolute;left:64px;top:110px;width:46px;height:23px;line-height:23px;z-index:8;">Area:</label>

<input type="text" id="pnomloc" style="position:absolute;left:153px;top:140px;width:172px;height: 25px;z-index:6;" name="txt_pnomloc" value="" spellcheck="false">
<input type="hidden" id="pidloc" style="position:absolute;left:408px;top:116px;width:65px;height:16px;z-index:7;" name="txt_pidloc" value="" spellcheck="false">
  <label for="" id="Label4" style="position:absolute;left:64px;top:140px;width:46px;height:23px;line-height:23px;z-index:8;">Local:</label>  

<input type="text" id="dsaqwe" style="position:absolute;left:153px;top:180px;width:245px;height:25px;z-index:4;" name="txt_pnomusu" value="" spellcheck="false">
<input type="hidden" id="aaidemp" style="position:absolute;left:405px;top:70px;width:68px;height:16px;z-index:5;" name="txt_pnomid" value="" spellcheck="false">  
<label for="" id="Label4" style="position:absolute;left:54px;top:180px;width:46px;height:23px;line-height:23px;z-index:8;">Empleado:</label>  
<input type="submit" id="Button4" name="btn_crearpuesto" value="Crear Puesto" style="position:absolute;left:123px;top:240px;width:150px;height:35px;z-index:33;">
</form>
</div>
    <input type="submit" id="Button7" name="btn_semple" value="Añadir Empleado" style="position:absolute;left:110px;top:150px;width:150px;height:35px;z-index:12;" onclick="puestos()">

<div id="myModal14" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close4">CERRAR</span>
         <script>
        var modal14 = document.getElementById("myModal14");      
        var cerrar = document.getElementsByClassName("close4")[0];
        
        cerrar.onclick = function() {
          modal14.style.display = "none";
        } 
        </script>
       <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="identidad">IDENTIDAD</th>
                                        <th data-field="nombreusu">NOMBRE</th>
                                        <th data-field="idloc" data-editable="false">ID LOCAL</th>
                                        <th data-field="locnom">NOMBRE LOCAL</th>
                                        <th data-field="idarea" data-editable="false">ID AREA</th>
                                        <th data-field="nomarea" data-editable="false">NOMBRE AREA</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                        
                                        db.query.execute("SELECT Empleado_Area.id_area, area.nombre, "
                                                        + "Empleado_Area.id_local, locales.loc_nom, "
                                                        + "Empleado_Area.identidad, usuarios.nombre "                                               
                                                        + "FROM Empleado_Area "
                                                        + "INNER JOIN locales ON "
                                                        + "Empleado_Area.id_local = locales.id_local "
                                                        + "INNER JOIN usuarios ON "
                                                        + "Empleado_Area.identidad = usuarios.identidad "
                                                        + "INNER JOIN area ON "
                                                        + "Empleado_Area.id_area = area.id_area "
                                                        + "WHERE Empleado_Area.id_local = "+session.getAttribute("s_loc")+" ");
                                        ResultSet puesemp = db.query.getResultSet();
                                        
                                        int pida,pidl;
                                        String pidu, pnoma,pnoml,pnomu;
                                        
                                        while (puesemp.next()) {
                                            pida = Integer.parseInt(puesemp.getString(1));
                                            pnoma = puesemp.getString(2);
                                            pidl = Integer.parseInt(puesemp.getString(3));
                                            pnoml = puesemp.getString(4);
                                            pidu = puesemp.getString(5);
                                            pnomu = puesemp.getString(6);
                                            
                                    %>
                                    <tr>
                                        <td><%=pida%></td>
                                        <td><%=pnoma%></td>
                                        <td><%=pidl%></td>
                                        <td><%=pnoml%></td>
                                        <td><%=pidu%></td>
                                        <td><%=pnomu%></td>
                                        <td><input type="button" value="Elección" 
                                        onclick="puestosdatos('<%=pida%>','<%=pnoma%>','<%=pidl%>','<%=pnoml%>','<%=pidu%>','<%=pnomu%>')"/></td>   
                                      </tr>
                                    <%  }%>
                                </tbody>
      </table> 
        
        
                
  </div>
</div>

<div style="position:absolute;top:350px;left:30px;width: 900px">
     <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="idpuesto">ID PUESTO</th>
                                        <th data-field="idarea">ID AREA</th>
                                        <th data-field="idlocal" data-editable="false">ID LOCAL</th>
                                        <th data-field="idusu">IDENTIDAD</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="estado" data-editable="false">ESTADO</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                        
                                        db.query.execute("select * from puestos "
                                                        + "WHERE puestos.id_local = "+session.getAttribute("s_loc")+" ");
                                        ResultSet puesto = db.query.getResultSet();
                                        
                                        int id_p, id_a,id_l;
                                        String id,nom,est;

                                        
                                        while (puesto.next()) {
                                             id_p = Integer.parseInt(puesto.getString(1));
                                             id_a = Integer.parseInt(puesto.getString(2));
                                             id_l = Integer.parseInt(puesto.getString(3));
                                             id = puesto.getString(4);
                                             nom = puesto.getString(5);
                                             est = puesto.getString(6);
                                    %>
                                    <tr>
                                            <td><%=id_p%></td>
                                            <td><%=id_a%></td>
                                            <td><%=id_l%></td>
                                            <td><%=id%></td>
                                            <td><%=nom%></td>
                                            <td><%=est%></td>
                                            <td><input type="button" value="Eliminar" 
                                                    onclick="window.location='SucursalGerente.jsp?p_id=<%=id_p%>&eli_pues=1'"/></td>
                                    </tr>
                                    
                                    <%  }%>
                                </tbody>
      </table>
     </div>    
    
    
</div>
</div>
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