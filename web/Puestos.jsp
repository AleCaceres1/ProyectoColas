<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<!doctype html>
<jsp:include page="procedimientos.jsp" flush="true"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<title>Gestion de Puestos</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="base/jquery-ui.min.css" rel="stylesheet">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/Puestos.css" rel="stylesheet">
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
<link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
<link rel="stylesheet" href="css/modal.css">
<script src="js/Metodos.js"></script>
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
<div style="height:784px;" id="tabs1-page-1">
</div>
<div id="Tabs1" style="position:absolute;left:151px;top:132px;width:1257px;height:830px;z-index:0;">
<ul>
<li><a href="#tabs1-page-1"><span><i class="fa fa-id-card-o tabs-icon"></i><br>Puestos</span></a></li>
<li id="opci"><a href="#tabs1-page-2"><span><i class="fa fa-th-list tabs-icon"></i><br>Opciones</span></a></li>
</ul>
<div style="height:784px;" id="tabs1-page-1">

    <div style="position:absolute;top:150px;left:30px;width: 900px">
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
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                        Dba db = new Dba();
                                        db.Conectar();
                                        db.query.execute("select * from puestos "
                                                        + "WHERE puestos.id_puesto = "+session.getAttribute("s_pues")+" ");
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
                                    </tr>                                   
                                    <%  }%>
                                </tbody>
      </table>
     </div>
    <div id="botones" style="position:absolute;top:350px;left:350px;width: 900px">
        <form name="Fpuestos" method="post" action="Puestos.jsp">
            <input type="submit" value="Entrar al puesto" id="entrar" name="btn_entrar" style="height: 50px"> 
            <input type="submit" value="Salir del puesto" id="salir" name="btn_salir" style="height: 50px" onclick="salir();">   
        </form>       
    </div>
                           
                                
</div>
<div style="height:784px;" id="tabs1-page-2">
    <div style="width: 1100">
        <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="ticket">TICKET</th>
                                        <th data-field="identidad">IDENTIDAD CLIENTE</th>
                                        <th data-field="nomcli" data-editable="false">NOMBRE CLIENTE</th>
                                        <th data-field="disca">PREFERENCIA</th>
                                        <th data-field="fecha1" data-editable="false">INGRESO</th>
                                        <th data-field="fecha2" data-editable="false">ATENCION</th>
                                        <th data-field="idlocal" data-editable="false">ID LOCAL</th>
                                        <th data-field="nomlocal" data-editable="false">LOCAL</th>
                                        <th data-field="idarea" data-editable="false">ID AREA</th>
                                        <th data-field="nomarea" data-editable="false">AREA</th>
                                        <th data-field="op" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                       
                                        db.query.execute("SELECT Transaccion_en_curso.ticket, Transaccion_en_curso.identidad, Transaccion_en_curso.nombre,Transaccion_en_curso.discapacidad, Transaccion_en_curso.fechayhora1, Transaccion_en_curso.fechayhora2, "
                                                       + "Transaccion_en_curso.id_local, locales.loc_nom, "
                                                       + "Transaccion_en_curso.id_area, area.nombre "
                                                       + "FROM Transaccion_en_curso "
                                                + "INNER JOIN locales ON "
                                                + "Transaccion_en_curso.id_local = locales.id_local "
                                                + "INNER JOIN area ON "
                                                + "Transaccion_en_curso.id_area = area.id_area "
                                                + "WHERE Transaccion_en_curso.id_area = "+session.getAttribute("s_area")+" "
                                                + "ORDER BY ticket ");
                                        
                                        ResultSet transcurso = db.query.getResultSet();
                                        
                                        int aticket,aidloc,aidarea;
                                        String aidcli,anomcli,adisc,afecha,anomloc,anomarea,afecha2;

                                        
                                        while (transcurso.next()) {
                                            aticket = Integer.parseInt(transcurso.getString(1));
                                            aidcli = transcurso.getString(2);
                                            anomcli = transcurso.getString(3);
                                            adisc = transcurso.getString(4);
                                            afecha = transcurso.getString(5);
                                            afecha2 = transcurso.getString(6);
                                            aidloc = Integer.parseInt(transcurso.getString(7));
                                            anomloc = transcurso.getString(8);
                                            aidarea = Integer.parseInt(transcurso.getString(9));
                                            anomarea = transcurso.getString(10);
                                             
                                    %>
                                    <tr>
                                            <td><%=aticket%></td>
                                            <td><%=aidcli%></td>
                                            <td><%=anomcli%></td>
                                            <td><%=adisc%></td>
                                            <td><%=afecha%></td>
                                            <td><%=afecha2%></td>
                                            <td><%=aidloc%></td>
                                            <td><%=anomloc%></td>
                                            <td><%=aidarea%></td>
                                            <td><%=anomarea%></td>
                                            <td><input type="button" value="Finalizar" 
                                                    onclick="window.location='Puestos.jsp?atick=<%=aticket%>&aid=<%=aidcli%>&anom=<%=anomcli%>&adisc=<%=adisc%>&aloc=<%=aidloc%>&aarea=<%=aidarea%>&fecha1=<%=afecha%>&fecha2=<%=afecha2%>&finalizar=1'"/></td>
                                    </tr>                                   
                                    <%  }%>
                                </tbody>
      </table>
    </div>
    
    

    <div style="position:absolute;top:250px;left:30px;width: 1200px">
     <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="ticket">TICKET</th>
                                        <th data-field="identidad">IDENTIDAD CLIENTE</th>
                                        <th data-field="nomcli" data-editable="false">NOMBRE CLIENTE</th>
                                        <th data-field="disca">PREFERENCIA</th>
                                        <th data-field="fecha" data-editable="false">FECHA Y HORA</th>
                                        <th data-field="idlocal" data-editable="false">ID LOCAL</th>
                                        <th data-field="nomlocal" data-editable="false">LOCAL</th>
                                        <th data-field="idarea" data-editable="false">ID AREA</th>
                                        <th data-field="nomarea" data-editable="false">AREA</th>
                                        <th data-field="siguiente" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                       
                                        db.query.execute("SELECT ticket_cliente.ticket, ticket_cliente.identidad, ticket_cliente.nombre,ticket_cliente.discapacidad, ticket_cliente.fechayhora, "
                                                       + "ticket_cliente.id_local, locales.loc_nom, "
                                                       + "ticket_cliente.id_area, area.nombre "
                                                       + "FROM ticket_cliente "
                                                + "INNER JOIN locales ON "
                                                + "ticket_cliente.id_local = locales.id_local "
                                                + "INNER JOIN area ON "
                                                + "ticket_cliente.id_area = area.id_area "
                                                + "WHERE ticket_cliente.id_area = "+session.getAttribute("s_area")+" "
                                                + "ORDER BY ticket ");
                                        
                                        ResultSet cola = db.query.getResultSet();
                                        
                                        int ticket,idloc,idarea;
                                        String idcli,nomcli,disc,fecha,nomloc,nomarea;

                                        
                                        while (cola.next()) {
                                            ticket = Integer.parseInt(cola.getString(1));
                                            idcli = cola.getString(2);
                                            nomcli = cola.getString(3);
                                            disc = cola.getString(4);
                                            fecha = cola.getString(5);
                                            idloc = Integer.parseInt(cola.getString(6));
                                            nomloc = cola.getString(7);
                                            idarea = Integer.parseInt(cola.getString(8));
                                            nomarea = cola.getString(9);
                                             
                                    %>
                                    <tr>
                                            <td><%=ticket%></td>
                                            <td><%=idcli%></td>
                                            <td><%=nomcli%></td>
                                            <td><%=disc%></td>
                                            <td><%=fecha%></td>
                                            <td><%=idloc%></td>
                                            <td><%=nomloc%></td>
                                            <td><%=idarea%></td>
                                            <td><%=nomarea%></td>
                                            <td><input type="button" value="Siguiente" 
                                                    onclick="window.location='Puestos.jsp?tick=<%=ticket%>&id=<%=idcli%>&nom=<%=nomcli%>&disc=<%=disc%>&loc=<%=idloc%>&area=<%=idarea%>&fecha=<%=fecha%>&siguiente=1'"/></td>
                                        <%  }%>
                                        
                                    </tr>                                   
                                    
                                    
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


       <jsp:include page="ocultar.jsp"></jsp:include>
</body>
</html>