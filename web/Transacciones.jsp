<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Transacciones</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/Transacciones.css" rel="stylesheet">
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
<link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
<link rel="stylesheet" href="css/modal.css">

</head>
<body>
<div id="wb_ResponsiveMenu1" style="position:absolute;left:0px;top:0px;width:1560px;height:79px;z-index:0;">
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
<div style="position: absolute;top: 100px;width: 1500px;">
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
                                        <th data-field="fecha3" data-editable="false">DESPACHO</th>
                                        <th data-field="idlocal" data-editable="false">ID LOCAL</th>
                                        <th data-field="nomlocal" data-editable="false">LOCAL</th>
                                        <th data-field="idarea" data-editable="false">ID AREA</th>
                                        <th data-field="nomarea" data-editable="false">AREA</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                        Dba db = new Dba();
                                        db.Conectar();
                                        db.query.execute("SELECT final.ticket, final.identidad, final.nombre,final.discapacidad, final.fechayhora1, final.fechayhora2, final.fechayhora3, "
                                                       + "final.id_local, locales.loc_nom, "
                                                       + "final.id_area, area.nombre "
                                                       + "FROM final "
                                                + "INNER JOIN locales ON "
                                                + "final.id_local = locales.id_local "
                                                + "INNER JOIN area ON "
                                                + "final.id_area = area.id_area "                                                
                                                + "ORDER BY ticket ");
                                        
                                        ResultSet tfin = db.query.getResultSet();
                                        
                                        int aticket,aidloc,aidarea;
                                        String aidcli,anomcli,adisc,afecha,anomloc,anomarea,afecha2,afecha3;

                                        
                                        while (tfin.next()) {
                                            aticket = Integer.parseInt(tfin.getString(1));
                                            aidcli = tfin.getString(2);
                                            anomcli = tfin.getString(3);
                                            adisc = tfin.getString(4);
                                            afecha = tfin.getString(5);
                                            afecha2 = tfin.getString(6);
                                            afecha3 = tfin.getString(7);
                                            aidloc = Integer.parseInt(tfin.getString(8));
                                            anomloc = tfin.getString(9);
                                            aidarea = Integer.parseInt(tfin.getString(10));
                                            anomarea = tfin.getString(11);
                                             
                                    %>
                                    <tr>
                                            <td><%=aticket%></td>
                                            <td><%=aidcli%></td>
                                            <td><%=anomcli%></td>
                                            <td><%=adisc%></td>
                                            <td><%=afecha%></td>
                                            <td><%=afecha2%></td>
                                            <td><%=afecha3%></td>
                                            <td><%=aidloc%></td>
                                            <td><%=anomloc%></td>
                                            <td><%=aidarea%></td>
                                            <td><%=anomarea%></td>
                                    </tr>                                   
                                    <%  }%>
                                </tbody>
      </table>
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