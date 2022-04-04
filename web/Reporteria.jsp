<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Reporteria"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>


<!doctype html>
<jsp:include page="procedimientos.jsp"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<title>Reporteria</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/Reporteria.css" rel="stylesheet">
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
<br><br>&nbspID Local: <%out.print(session.getAttribute("s_loc"));%>
</li>
</ul>
</div>

<div style="position: absolute; top: 200px; left: 450px">
    <form  method="POST">
    <label style="font-size: 20px">Contador de Usuarios: </label>
    <select name="roles">
        <option>Empleado</option>
        <option>Gerente</option>
    </select>
    <input type="submit" id="webservice" name="webservice" value="Calcular">
    <input type="text" id="total" name="total">
    </form>    
</div>
    <%-- start web service invocation --%><hr/>
    <%
    if(request.getParameter("webservice")!= null){
            
    try {
	WebServices.Contador_Service service = new WebServices.Contador_Service();
	WebServices.Contador port = service.getContadorPort();
	 // TODO initialize WS operation arguments here
	String rol = request.getParameter("roles");
	// TODO process result here
	int result = port.calculo(rol);
	//out.print("<script>alert('"+result+"')</script>");
        %>
        <script>
            document.getElementById("total").value = <%=result%>;
        </script>
        <%
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    }
        
    %>
    
    <div style="position: absolute; top: 250px; left: 450px">
    <form  method="POST">
    <label style="font-size: 20px">Transacciones por Local: </label>
    <select name="locales">
        <%
        
                                        //Cargar datos a la tabla usuarios
                                        Dba db = new Dba();
                                        db.Conectar();
                                        db.query.execute("select * from locales");
                                        ResultSet rs = db.query.getResultSet();
                                        int id_local;
                                        String nombre = null;
                                        
                                        
                                        
                                        while (rs.next()) {
                                          id_local = rs.getInt(1);
                                          
                                    %>
        
                            <option><%=id_local%></option>
                                <%}%>
                        </select>                                             
    <input type="submit" id="webservice2" name="webservice2" value="Obtener info">
    
    </form>   
      <%
        if(request.getParameter("webservice2")!= null){
            WebServices.Contador_Service service = new WebServices.Contador_Service();
            WebServices.Contador port = service.getContadorPort();
            Gson g = new Gson();
            Type listType = new TypeToken<ArrayList<Reporteria>>() {}.getType();
            ArrayList<Reporteria> li = g.fromJson(port.porLocal(request.getParameter("locales")),listType);
            %>
            <div style="position: absolute; width: 1300px; left: -320px">
                <table id="table" style="background-color: #ffffff " data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                       data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                <thead>
                    <tr>
                        <th>TICKET</th>
                        <th>IDENTIDAD</th>
                        <th>NOMBRE</th>
                        <th>DISCAPACIDAD</th>
                        <th>ID LOCAL</th>
                        <th>ID AREA</th>
                        <th>CREADO</th>
                        <th>ATENDIDO</th>
                        <th>DESPACHADO</th>
                    </tr>
                </thead>
                <tbody>         
            <%
            for(Reporteria temp:li){
             
              %>
              <tr>
                        <td><%=temp.getTicket()%></td>
                        <td><%=temp.getIdentidad()%></td>
                        <td><%=temp.getNombre()%></td>
                        <td><%=temp.getDiscapacidad()%></td>
                        <td><%=temp.getId_local()%></td>                       
                        <td><%=temp.getId_area()%></td>
                        <td><%=temp.getFecha1()%></td>
                        <td><%=temp.getFecha2()%></td>
                        <td><%=temp.getFecha3()%></td>
              </tr>
            <% } //cierre del for%>
            </tbody>
            </table>
          </div>  
       <%} //cierre del if%>
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