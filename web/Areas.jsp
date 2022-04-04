<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<!doctype html>
<jsp:include page="procedimientos.jsp"/>
<html>
<head>
<meta charset="utf-8">
<title>Gestion de Areas</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="base/jquery-ui.min.css" rel="stylesheet">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/Areas.css" rel="stylesheet">
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
<div id="Tabs1" style="position:absolute;left:255px;top:102px;width:957px;height:764px;z-index:46;">
<ul>
<li><a href="#tabs1-page-1"><span><i class="fa fa-plus-square tabs-icon"></i><br>Agregar Area</span></a></li>
<li><a href="#tabs1-page-3"><span><i class="fa fa-wrench tabs-icon"></i><br>Modificar</span></a></li>
<li><a href="#tabs1-page-4"><span><i class="fa fa-trash-o tabs-icon"></i><br>Eliminar</span></a></li>
<li><a href="#tabs1-page-5"><span><i class="fa fa-etsy tabs-icon"></i><br>Empleados</span></a></li>
</ul>
<div style="height:718px;" id="tabs1-page-1">
<div id="wb_Form4" style="position:absolute;left:226px;top:23px;width:505px;height:272px;z-index:10;">
<form name="Form4" method="post" action="Areas.jsp" >
<div id="wb_Text2" style="position:absolute;left:193px;top:26px;width:119px;height:28px;z-index:0;">
<span style="color:#000000;font-family:'Comic Sans MS';font-size:20px;"><strong><em>Crear Area</em></strong></span></div>
<label for="" id="Label1" style="position:absolute;left:27px;top:63px;width:167px;height:41px;line-height:41px;z-index:1;">Nombre del Area:</label>
<input type="text" id="Editbox4" style="position:absolute;left:202px;top:74px;width:262px;height:25px;z-index:2;" name="txt_areanom" value="" spellcheck="false">
<input type="text" id="txt_locarea" style="position:absolute;left:202px;top:121px;width:34px;height:25px;z-index:3;" name="txt_locarea" value="" spellcheck="false">
<label for="" id="Label7" style="position:absolute;left:41px;top:118px;width:153px;height:28px;line-height:28px;z-index:4;">Local Asignado:</label>
<input type="submit" id="Button2" name="btn_crearea" value="Crear Area" style="position:absolute;left:237px;top:215px;width:114px;height:35px;z-index:5;">
<input type="text" id="txt_emplocnom" style="position:absolute;left:268px;top:121px;width:196px;height:25px;z-index:6;" name="Editbox1" value="" spellcheck="false">
<label for="" id="Label5" style="position:absolute;left:24px;top:166px;width:159px;height:26px;line-height:26px;z-index:7;">Tipo Transaccion: </label>
<input type="text" id="txt_ttid" style="position:absolute;left:202px;top:170px;width:34px;height:25px;z-index:8;" name="txt_idtran" value="" spellcheck="false">
<input type="text" id="txt_ttnom" style="position:absolute;left:268px;top:170px;width:200px;height:25px;z-index:9;" name="txt_trannom" value="" spellcheck="false">
<input type="button" id="btn_loc" name="btn_locarea" value="Asignar Local" style="position:absolute;left:80px;top:280px;width:150px;height:38px;line-height:28px;z-index:4;" onclick="arealocal()">
<input type="button" id="btn_tt" name="btn_ttran" value="Asignar Transaccion" style="position:absolute;left:290px;top:280px;width:190px;height:38px;line-height:28px;z-index:4;" onclick="ttarea()">
</form>
</div>
<div id="myModal6" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close">CERRAR</span>
         <script>
        var modal6 = document.getElementById("myModal6");      
        var cerrar = document.getElementsByClassName("close")[0];
        
        cerrar.onclick = function() {
          modal6.style.display = "none";
        } 
        </script>
        
       <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="id">ID</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        Dba db = new Dba();
                                        db.Conectar();
                                        db.query.execute("select id_local, loc_nom from locales");
                                        ResultSet locarea = db.query.getResultSet();
                                        
                                        int id;
                                        String nombre;
                                        
                                        while (locarea.next()) {

                                            id = Integer.parseInt(locarea.getString(1));
                                            nombre = locarea.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="aemploc('<%=id%>','<%=nombre%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>         
  </div>
</div>    
<div id="myModal7" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close1">CERRAR</span>
         <script>
        var modal7 = document.getElementById("myModal7");      
        var cerrar = document.getElementsByClassName("close1")[0];
        
        cerrar.onclick = function() {
          modal7.style.display = "none";
        } 
        </script>
        
       <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="id">ID</th>
                                        <th data-field="nombre" data-editable="false">TIPO TRANSACCION</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select * from tipo_transaccion");
                                        ResultSet tt = db.query.getResultSet();
                                        
                                        
                                        while (tt.next()) {

                                            id = Integer.parseInt(tt.getString(1));
                                            nombre = tt.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="ttareas('<%=id%>','<%=nombre%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>         
  </div>
</div>    
<div style="position:absolute;top:370px;left:130px;">
     <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="idarea">ID AREA</th>
                                        <th data-field="idlocal">ID LOCAL</th>
                                        <th data-field="nombrelocal" data-editable="false">NOMBRE LOCAL</th>
                                        <th data-field="idusuario">NOMBRE AREA</th>
                                        <th data-field="idtran" data-editable="false">ID TRAN</th>
                                        <th data-field="tipo" data-editable="false">TIPO TRANSACCION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select area.id_area, area.id_local, locales.loc_nom,area.nombre, area.id_tt, tipo_transaccion.tipo "
                                        + "FROM area "
                                        + "INNER JOIN locales ON "
                                        + "area.id_local = locales.id_local "
                                        + "INNER JOIN tipo_transaccion ON "
                                        + "area.id_tt = tipo_transaccion.id_tt");
                                        ResultSet area = db.query.getResultSet();
                                        
                                        int areaid, locareaid, ttid;                                        
                                        String loc_nom,areanom,tipo;
                                        
                                        while (area.next()) {

                                            areaid = Integer.parseInt(area.getString(1));
                                            locareaid = Integer.parseInt(area.getString(2));
                                            loc_nom = area.getString(3);
                                            areanom = area.getString(4);
                                            ttid = Integer.parseInt(area.getString(5));
                                            tipo = area.getString(6);
                                    %>
                                    <tr>
                                        <td><%=areaid%></td>
                                        <td><%=locareaid%></td>
                                        <td><%=loc_nom%></td>
                                        <td><%=areanom%></td>
                                        <td><%=ttid%></td>
                                        <td><%=tipo%></td>  
                                      </tr>
                                    <%  }%>
                                </tbody>
      </table>
     </div>       
</div>

<div style="height:718px;" id="tabs1-page-3">
    
    <div id="wb_Form4" style="position:absolute;left:226px;top:23px;width:505px;height:272px;z-index:10;">
<form name="Form4" method="post" action="Areas.jsp" >
<div id="wb_Text2" style="position:absolute;left:193px;top:26px;width:119px;height:28px;z-index:0;">
<span style="color:#000000;font-family:'Comic Sans MS';font-size:20px;"><strong><em>Crear Area</em></strong></span></div>
<label for="" id="Label1" style="position:absolute;left:27px;top:63px;width:167px;height:41px;line-height:41px;z-index:1;">Nombre del Area:</label>
<input type="text" id="txt_modnom" style="position:absolute;left:202px;top:74px;width:262px;height:25px;z-index:2;" name="txt_mareanom" value="" spellcheck="false">
<input type="text" id="txt_mlocarea" style="position:absolute;left:202px;top:121px;width:34px;height:25px;z-index:3;" name="txt_mlocarea" value="" spellcheck="false">
<label for="" id="Label7" style="position:absolute;left:41px;top:118px;width:153px;height:28px;line-height:28px;z-index:4;">Local Asignado:</label>
<input type="submit" id="Button2" name="btn_modarea" value="Cambiar Area" style="position:absolute;left:237px;top:215px;width:134px;height:35px;z-index:5;">
<input type="text" id="txt_memplocnom" style="position:absolute;left:268px;top:121px;width:196px;height:25px;z-index:6;" name="Editbox1" value="" spellcheck="false">
<label for="" id="Label5" style="position:absolute;left:24px;top:166px;width:159px;height:26px;line-height:26px;z-index:7;">Tipo Transaccion: </label>
<input type="text" id="txt_mttid" style="position:absolute;left:202px;top:170px;width:34px;height:25px;z-index:8;" name="txt_midtran" value="" spellcheck="false">
<input type="text" id="txt_mttnom" style="position:absolute;left:268px;top:170px;width:200px;height:25px;z-index:9;" name="txt_trannom" value="" spellcheck="false">
<input type="button" id="btn_loc" name="btn_modlocarea" value="Cambiar Local" style="position:absolute;left:80px;top:280px;width:150px;height:38px;line-height:28px;z-index:4;" onclick="modlocarea()">
<input type="button" id="btn_tt" name="btn_modttran" value="Cambiar Transaccion" style="position:absolute;left:290px;top:280px;width:190px;height:38px;line-height:28px;z-index:4;" onclick="mttarea()">
<input type="hidden" id="txt_midarea" name="txt_maidarea" style="top: 50px;width: 50px;">
</form>
</div>
<div id="myModal8" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close2">CERRAR</span>
         <script>
        var modal8 = document.getElementById("myModal8");      
        var cerrar = document.getElementsByClassName("close2")[0];
        
        cerrar.onclick = function() {
          modal8.style.display = "none";
        } 
        </script>
        
       <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="id">ID</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales                                       
                                        db.query.execute("select id_local, loc_nom from locales");
                                        ResultSet modloc = db.query.getResultSet();

                                        
                                        while (modloc.next()) {

                                            id = Integer.parseInt(modloc.getString(1));
                                            nombre = modloc.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="modlocareadatos('<%=id%>','<%=nombre%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>         
  </div>
</div>    
<div id="myModal9" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close3">CERRAR</span>
         <script>
        var modal9 = document.getElementById("myModal9");      
        var cerrar = document.getElementsByClassName("close3")[0];
        
        cerrar.onclick = function() {
          modal9.style.display = "none";
        } 
        </script>
        
       <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="id">ID</th>
                                        <th data-field="nombre" data-editable="false">TIPO TRANSACCION</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select * from tipo_transaccion");
                                        ResultSet modtt = db.query.getResultSet();
                                        
                                        
                                        while (modtt.next()) {

                                            id = Integer.parseInt(modtt.getString(1));
                                            nombre = modtt.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="mttareas('<%=id%>','<%=nombre%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>         
  </div>
</div>    
                                
<div style="position:absolute;top:450px;left:30px;width: 900px">
     <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="idarea">ID AREA</th>
                                        <th data-field="idlocal">ID LOCAL</th>
                                        <th data-field="nombrelocal" data-editable="false">NOMBRE LOCAL</th>
                                        <th data-field="idusuario">NOMBRE AREA</th>
                                        <th data-field="idtran" data-editable="false">ID TRAN</th>
                                        <th data-field="tipo" data-editable="false">TIPO TRANSACCION</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select area.id_area, area.id_local, locales.loc_nom,area.nombre, area.id_tt, tipo_transaccion.tipo "
                                        + "FROM area "
                                        + "INNER JOIN locales ON "
                                        + "area.id_local = locales.id_local "
                                        + "INNER JOIN tipo_transaccion ON "
                                        + "area.id_tt = tipo_transaccion.id_tt");
                                        ResultSet modarea = db.query.getResultSet();
                                        
                                        int mareaid;
                                        
                                        while (modarea.next()) {

                                            mareaid = Integer.parseInt(modarea.getString(1));
                                            locareaid = Integer.parseInt(modarea.getString(2));
                                            loc_nom = modarea.getString(3);
                                            areanom = modarea.getString(4);
                                            ttid = Integer.parseInt(modarea.getString(5));
                                            tipo = modarea.getString(6);
                                    %>
                                    <tr>
                                        <td><%=mareaid%></td>
                                        <td><%=locareaid%></td>
                                        <td><%=loc_nom%></td>
                                        <td><%=areanom%></td>
                                        <td><%=ttid%></td>
                                        <td><%=tipo%></td>
                                        <td><input type="button" value="Modificar" 
                                                    onclick="modarea('<%=mareaid%>','<%=locareaid%>','<%=loc_nom%>','<%=areanom%>','<%=ttid%>','<%=tipo%>')"/></td>                                        
                                      </tr>
                                    <%  }%>
                                </tbody>
      </table>
     </div>
    
</div>

                                
<div style="height:718px;" id="tabs1-page-4">
    <center style="font-size: 30px">Eliminar Area</center>
        
    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>
                                        <th data-field="idarea">ID AREA</th>
                                        <th data-field="idlocal">ID LOCAL</th>
                                        <th data-field="nombrelocal" data-editable="false">NOMBRE LOCAL</th>
                                        <th data-field="idusuario">NOMBRE AREA</th>
                                        <th data-field="idtran" data-editable="false">ID TRAN</th>
                                        <th data-field="tipo" data-editable="false">TIPO TRANSACCION</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select area.id_area, area.id_local, locales.loc_nom,area.nombre, area.id_tt, tipo_transaccion.tipo "
                                        + "FROM area "
                                        + "INNER JOIN locales ON "
                                        + "area.id_local = locales.id_local "
                                        + "INNER JOIN tipo_transaccion ON "
                                        + "area.id_tt = tipo_transaccion.id_tt");
                                        ResultSet eliarea = db.query.getResultSet();
                                                                              
                                        while (eliarea.next()) {

                                            mareaid = Integer.parseInt(eliarea.getString(1));
                                            locareaid = Integer.parseInt(eliarea.getString(2));
                                            loc_nom = eliarea.getString(3);
                                            areanom = eliarea.getString(4);
                                            ttid = Integer.parseInt(eliarea.getString(5));
                                            tipo = eliarea.getString(6);
                                    %>
                                    <tr>
                                        <td><%=mareaid%></td>
                                        <td><%=locareaid%></td>
                                        <td><%=loc_nom%></td>
                                        <td><%=areanom%></td>
                                        <td><%=ttid%></td>
                                        <td><%=tipo%></td>
                                        <td><input type="button" value="Eliminar" 
                                                    onclick="window.location='Areas.jsp?p_id=<%=mareaid%>&eli_area=1'"/></td>   
                                      </tr>
                                    <%  }%>
                                </tbody>
      </table>
    
</div>
<div style="height:718px;" id="tabs1-page-5">
<div id="wb_Form3" style="position:absolute;left:201px;top:16px;width:579px;height:268px;z-index:22;">
<form name="Form2" method="post" action="Areas.jsp">
<label for="" id="Label2" style="position:absolute;left:109px;top:66px;width:81px;height:26px;line-height:26px;z-index:11;">Nombre: </label>
<label for="" id="Label3" style="position:absolute;left:132px;top:111px;width:58px;height:23px;line-height:23px;z-index:12;">Local: </label>
<input type="submit" id="Button6" name="btn_areaemp" value="Asignar Empleado" style="position:absolute;left:208px;top:214px;width:150px;height:35px;z-index:13;">
<label for="" id="Label9" style="position:absolute;left:112px;top:16px;width:595px;height:24px;line-height:24px;z-index:14;">Registrar Empleado en el Area de un Local</label>
<input type="text" id="txt_empnom" style="position:absolute;left:203px;top:70px;width:175px;height:25px;z-index:15;" name="txt_empnom" value="" spellcheck="false">
<input type="text" id="txt_empid" style="position:absolute;left:405px;top:70px;width:68px;height:25px;z-index:16;" name="txt_empid" value="" spellcheck="false">
<input type="text" id="aaa" style="position:absolute;left:206px;top:116px;width:172px;height:25px;z-index:17;" name="txt_emplocnom" value="" spellcheck="false">
<input type="text" id="txt_emplocid" style="position:absolute;left:408px;top:116px;width:65px;height:25px;z-index:18;" name="txt_emplocid" value="" spellcheck="false">
<label for="" id="Label4" style="position:absolute;left:132px;top:157px;width:46px;height:23px;line-height:23px;z-index:19;">Area:</label>
<input type="text" id="txt_nomarea" style="position:absolute;left:208px;top:159px;width:170px;height:25px;z-index:20;" name="txt_emparea" value="" spellcheck="false">
<input type="text" id="txt_areaid" style="position:absolute;left:405px;top:159px;width:65px;height:25px;z-index:21;" name="txt_areaid" value="" spellcheck="false">
</form>
</div>
<input type="submit" id="Button7" name="btn_emple" value="Añadir Empleado" style="position:absolute;left:310px;top:307px;width:150px;height:35px;z-index:23;" onclick="locareaemp()">
<input type="submit" id="Button5" name="btn_emparea" value="Añadir Area" style="position:absolute;left:522px;top:307px;width:150px;height:35px;z-index:24;" onclick="areaemp()">

<div id="myModal10" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close4">CERRAR</span>
         <script>
        var modal10 = document.getElementById("myModal10");      
        var cerrar = document.getElementsByClassName("close4")[0];
        
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
                                        //Cargar datos a la tabla locales
                                        db.query.execute("select Empleado_Local.id_local, locales.loc_nom, Empleado_Local.identidad, usuarios.nombre "
                                        + "FROM Empleado_Local "
                                        + "INNER JOIN locales ON "
                                        + "Empleado_Local.id_local = locales.id_local "
                                        + "INNER JOIN usuarios ON "
                                        + "Empleado_Local.identidad = usuarios.identidad");
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
                                        onclick="locareadatos('<%=locempid%>','<%=emplocnom%>','<%=empid%>','<%=empnom%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
                
  </div>
</div>
<div id="myModal11" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close5">CERRAR</span>
         <script>
        var modal11 = document.getElementById("myModal11");      
        var cerrar = document.getElementsByClassName("close5")[0];
        
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
                                                + "area.id_local = locales.id_local");
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
                                        onclick="areadatos('<%=ida%>','<%=anom%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
                
  </div>
</div>
<div style="position:absolute;top:450px;left:30px;width: 900px">
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
                                                        + "Empleado_Area.id_area = area.id_area");
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
                                                    onclick="window.location='Areas.jsp?emp_id=<%=iden%>&idloc=<%=ailoc%>&idare=<%=aidil%>&eli_emparea=1'"/></td>
                                      </tr>
                                    <%  }%>
                                </tbody>
      </table>
     </div>




</div>                                
</div>
                                
                                
<div id="wb_ResponsiveMenu1" style="position:absolute;left:0px;top:0px;width:1560px;height:79px;z-index:47;">
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