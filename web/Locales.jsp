<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<!doctype html>
<jsp:include page="procedimientos.jsp"/>
<html>
<head>
<meta charset="utf-8">
<title>Gestion de Locales</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="base/jquery-ui.min.css" rel="stylesheet">
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/Locales.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
<link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
<link rel="stylesheet" href="css/modal.css">
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
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
<body onload="mostrar_mapa(),mostrar_mapamod()">
<div id="Tabs1" style="position:absolute;left:241px;top:79px;width:1040px;height:820px;z-index:55;">
<ul>
<li><a href="#tabs1-page-1"><span><i class="fa fa-plus-square tabs-icon"></i><br>Agregar Local</span></a></li>
<li><a href="#tabs1-page-2"><span><i class="fa fa-align-justify tabs-icon"></i><br>Listar</span></a></li>
<li><a href="#tabs1-page-3"><span><i class="fa fa-wrench tabs-icon"></i><br>Modificar</span></a></li>
<li><a href="#tabs1-page-4"><span><i class="fa fa-trash-o tabs-icon"></i><br>Eliminar</span></a></li>
<li><a href="#tabs1-page-5"><span><i class="fa fa-glide-g tabs-icon"></i><br>Gerentes</span></a></li>
<li><a href="#tabs1-page-6"><span><i class="fa fa-etsy tabs-icon"></i><br>Empleados</span></a></li>
</ul>
<div style="height:718px;" id="tabs1-page-1">
<div id="wb_Form1" style="position:absolute;left:253px;top:37px;width:451px;height:217px;z-index:8;">
<div id="mapa" style="position:absolute; left: -245px; top: 250px; width: 1000px; height: 420px; border: 1px groove #006600;"></div>
<form name="F1" method="post" action="Locales.jsp">
<input type="text" id="Editbox2" style="position:absolute;left:174px;top:39px;width:243px;height:25px;z-index:0;" name="txt_locnom" value="" spellcheck="false">
<label for="" id="Label5" style="position:absolute;left:91px;top:82px;width:69px;height:29px;line-height:29px;z-index:1;">Latitud:</label>
<input type="text" id="txt_lati" style="position:absolute;left:174px;top:86px;width:243px;height:25px;z-index:2;" name="txt_lati" spellcheck="false">
<label for="" id="Label6" style="position:absolute;left:77px;top:119px;width:83px;height:37px;line-height:37px;z-index:3;">Longitud:</label>
<input type="text" id="txt_long" style="position:absolute;left:174px;top:134px;width:243px;height:25px;z-index:4;" name="txt_long"spellcheck="false">
<input type="submit" id="Button1" name="btn_crearlocal" value="Crear Local" style="position:absolute;left:176px;top:164px;width:114px;height:35px;z-index:5;">
<label for="" id="Label2" style="position:absolute;left:0px;top:28px;width:187px;height:41px;line-height:41px;z-index:6;">Nombre del Local:</label>
<div id="wb_Text1" style="position:absolute;left:174px;top:0px;width:119px;height:28px;z-index:7;">
<span style="color:#000000;font-family:'Comic Sans MS';font-size:20px;"><strong><em>Crear Local</em></strong></span></div>
</form>
</div>
</div>
<div style="height:718px;" id="tabs1-page-2">
    
    <div class="data-table-area mg-tb-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sparkline13-list">
                            <div class="sparkline13-hd">
                                <div class="main-sparkline13-hd">
                                    <Center><h1>Lista de Locales</h1></center>
                                </div>
                            </div>

                            <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                   data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                <thead>
                                    <tr>

                                        <th data-field="id">ID</th>
                                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                                        <th data-field="latitud" data-editable="false">LATITUD</th>
                                        <th data-field="longitud" data-editable="false">LONGITUD</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        Dba db = new Dba();
                                        db.Conectar();
                                        db.query.execute("select * from locales ORDER BY id_local");
                                        ResultSet rs = db.query.getResultSet();
                                        
                                        int id;
                                        String nombre,latitud,longitud;
                                        
                                        while (rs.next()) {

                                            id = Integer.parseInt(rs.getString(1));
                                            nombre = rs.getString(2);
                                            latitud = rs.getString(3);
                                            longitud = rs.getString(4);
                                            
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><%=latitud%></td>
                                        <td><%=longitud%></td>
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
<div style="height:718px;" id="tabs1-page-3">
 <Center><h1>Modificar Local y Area</h1></center>
    <div id="myModal" class="modal" >  
  <div class="modal-content" style="width: 100%;height: 100%">
    <span class="close">CERRAR</span>
         <script>
        var cerrar = document.getElementsByClassName("close")[0];
        
        cerrar.onclick = function() {
          modal.style.display = "none";
        } 
        </script>
        
    <p> <div id="wb_Form1" style="position:absolute;left:40px;top:80px;width:750px;height:418px;z-index:23;">
    <div id="mapamod" style="position:absolute; left: 450px; top: 30px; width: 840px; height: 420px; border: 1px groove #006600;z-index: 100"></div>    
<form name="fM2" action="Locales.jsp" method="POST">        
        <input type="text" id="midloc" style="position:absolute;left:195px;top:30px;width:243px;height:25px;z-index:0;" name="txt_id_loc" value="" spellcheck="false">
            <label for="" id="Label2" style="position:absolute;left:101px;top:17px;width:187px;height:41px;line-height:41px;z-index:6;">ID Local:</label>    
        <input type="text" id="mlocnom" style="position:absolute;left:195px;top:68px;width:243px;height:25px;z-index:0;" name="txt_mlocnom" value="" spellcheck="false">
            <label for="" id="Label2" style="position:absolute;left:21px;top:57px;width:187px;height:41px;line-height:41px;z-index:6;">Nombre del Local:</label>
        <input type="text" id="mlatitud" style="position:absolute;left:195px;top:115px;width:243px;height:25px;z-index:2;" name="txt_mlati" spellcheck="false">    
            <label for="" id="Label5" style="position:absolute;left:112px;top:111px;width:69px;height:29px;line-height:29px;z-index:1;">Latitud:</label>
        <input type="text" id="mlongitud" style="position:absolute;left:195px;top:157px;width:243px;height:25px;z-index:4;" name="txt_mlong" spellcheck="false">
            <label for="" id="Label6" style="position:absolute;left:98px;top:148px;width:83px;height:37px;line-height:37px;z-index:3;">Longitud:</label>        
        <input type="submit" id="Button1" name="bt_modloc" value="Modificar Local" style="position:absolute;left:197px;top:193px;width:114px;height:35px;z-index:5;">
    
</form>
</div>
    </p>
  </div>
</div>   
   <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
            ata-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                 <thead>
                    <tr>
                        <th data-field="id">ID</th>
                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                        <th data-field="latitud" data-editable="false">LATITUD</th>
                        <th data-field="longitud" data-editable="false">LONGITUD</th>
                        <th data-field="operacion" data-editable="false">OPERACION</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        //Cargar datos a la tabla modificar locales

                        db.query.execute("select * from locales ORDER BY id_local");
                        ResultSet mls = db.query.getResultSet();

                        while (mls.next()) {

                            id = Integer.parseInt(mls.getString(1));
                            nombre = mls.getString(2);
                            latitud = mls.getString(3);
                            longitud = mls.getString(4);

                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=nombre%></td>
                        <td><%=latitud%></td>
                        <td><%=longitud%></td>
                        <td><input type="button" value="Modificar" 
                        onclick="modloc('<%=id%>','<%=nombre%>','<%=latitud%>','<%=longitud%>')"/></td>
                    </tr>
                    <%  }%>
                </tbody>
            </table> 
    
</div>
<div style="height:718px;" id="tabs1-page-4">
    
    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
            ata-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                 <thead>
                    <tr>
                        <th data-field="id">ID</th>
                        <th data-field="nombre" data-editable="false">NOMBRE</th>
                        <th data-field="latitud" data-editable="false">LATITUD</th>
                        <th data-field="longitud" data-editable="false">LONGITUD</th>
                        <th data-field="operacion" data-editable="false">OPERACION</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        //Cargar datos a la tabla modificar locales

                        db.query.execute("select * from locales ORDER BY id_local");
                        ResultSet elc = db.query.getResultSet();

                        while (elc.next()) {

                            id = Integer.parseInt(elc.getString(1));
                            nombre = elc.getString(2);
                            latitud = elc.getString(3);
                            longitud = elc.getString(4);

                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=nombre%></td>
                        <td><%=latitud%></td>
                        <td><%=longitud%></td>
                        <td><input type="button" value="Eliminar" 
                        onclick="window.location='Locales.jsp?p_id1=<%=id%>&p_editar1=1'"/></td>
                    </tr>
                    <%  }%>
                </tbody>
            </table>
    
</div>
<div style="height:718px;" id="tabs1-page-5">
<div id="wb_Form2" style="position:absolute;left:260px;top:11px;width:436px;height:222px;z-index:17;">
<form name="Form2" method="post" action="Locales.jsp">
<label for="" id="Label3" style="position:absolute;left:50px;top:66px;width:81px;height:26px;line-height:26px;z-index:9;">Nombre: </label>
<label for="" id="Label4" style="position:absolute;left:73px;top:111px;width:58px;height:23px;line-height:23px;z-index:10;">Local: </label>
<input type="submit" id="Button3" name="btn_asigen" value="Asignar Gerente" style="position:absolute;left:139px;top:171px;width:150px;height:35px;z-index:11;">
<label for="" id="Label8" style="position:absolute;left:73px;top:16px;width:265px;height:24px;line-height:24px;z-index:12;">Registrar Gerente en Local</label>
<input type="text" id="txt_gennom" style="position:absolute;left:144px;top:70px;width:175px;height:25px;z-index:13;" name="txt_gennom" value="" spellcheck="false">
<input type="hidden" id="txt_genid" style="position:absolute;left:346px;top:70px;width:68px;height:16px;z-index:14;" name="txt_genid" value="" spellcheck="false">
<input type="text" id="txt_genlocnom" style="position:absolute;left:147px;top:116px;width:172px;height:25px;z-index:15;" name="txt_genlocnom" value="" spellcheck="false">
<input type="hidden" id="txt_genlocid" style="position:absolute;left:349px;top:116px;width:62px;height:16px;z-index:16;" name="txt_genlocid" value="" spellcheck="false">
</form>
</div>
    <input type="submit" id="Button2" name="btn_gen" value="Añadir Gerente" style="position:absolute;left:300px;top:245px;width:150px;height:35px;z-index:18;" onclick="genusuario()">
<input type="submit" id="Button4" name="btn_genloc" value="Añadir Local" style="position:absolute;left:503px;top:245px;width:150px;height:35px;z-index:19;" onclick="genlocal()">

                
<div id="myModal2" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close1">CERRAR</span>
         <script>
        var modal2 = document.getElementById("myModal2");      
        var cerrar = document.getElementsByClassName("close1")[0];
        
        cerrar.onclick = function() {
          modal2.style.display = "none";
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
                                        db.query.execute("select identidad, nombre from usuarios WHERE rol = 'Empleado'");
                                        ResultSet usugen = db.query.getResultSet();
                                        
                                        String identidad;
                                        while (usugen.next()) {

                                            identidad = usugen.getString(1);
                                            nombre = usugen.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=identidad%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="genusu('<%=identidad%>','<%=nombre%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table> 
        
  </div>
</div>                
<div id="myModal3" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close2">CERRAR</span>
         <script>
        var modal3 = document.getElementById("myModal3");      
        var cerrar = document.getElementsByClassName("close2")[0];
        
        cerrar.onclick = function() {
          modal3.style.display = "none";
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
                                        ResultSet locgen = db.query.getResultSet();
                                        
                                        
                                        while (locgen.next()) {

                                            id = Integer.parseInt(locgen.getString(1));
                                            nombre = usugen.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="genloc('<%=id%>','<%=nombre%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>         
  </div>
</div>
    
     <div style="position:absolute;top:350px;left:230px;">
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
                                        db.query.execute("select Gerente_Local.id_local, locales.loc_nom, Gerente_Local.identidad, usuarios.nombre "
                                        + "FROM Gerente_Local "
                                        + "INNER JOIN locales ON "
                                        + "Gerente_Local.id_local = locales.id_local "
                                        + "INNER JOIN usuarios ON "
                                        + "Gerente_Local.identidad = usuarios.identidad");
                                        ResultSet gerentes = db.query.getResultSet();
                                        int locgenid;
                                        
                                        String genlocnom,genid,gennom;
                                        
                                        while (gerentes.next()) {

                                            locgenid = Integer.parseInt(gerentes.getString(1));
                                            genlocnom = gerentes.getString(2);
                                            genid = gerentes.getString(3);
                                            gennom = gerentes.getString(4);
                                    %>
                                    <tr>
                                        <td><%=locgenid%></td>
                                        <td><%=genlocnom%></td>
                                        <td><%=genid%></td>
                                        <td><%=gennom%></td>
                                        <td><input type="button" value="Eliminar" 
                                        onclick="window.location='Locales.jsp?gen_id1=<%=locgenid%>&gen_id2=<%=genid%>&p_editar2=1'"/></td>
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
     </div>                                                   
                             
</div>                              

 <div style="height:718px;" id="tabs1-page-6">
    <input type="submit" id="Button5" name="btn_emploc" value="Añadir Local" style="position:absolute;left:563px;top:270px;width:150px;height:35px;z-index:28;" onclick="emplocal()">
<input type="submit" id="Button7" name="btn_emp" value="Añadir Empleado" style="position:absolute;left:360px;top:270px;width:150px;height:35px;z-index:29;" onclick="empusuario()">
<div id="wb_Form3" style="position:absolute;left:320px;top:37px;width:436px;height:222px;z-index:30;">
<form name="Form2" method="post" action="Locales.jsp">
<label for="" id="Label1" style="position:absolute;left:50px;top:66px;width:81px;height:26px;line-height:26px;z-index:20;">Nombre: </label>
<label for="" id="Label7" style="position:absolute;left:73px;top:111px;width:58px;height:23px;line-height:23px;z-index:21;">Local: </label>
<input type="submit" id="Button6" name="btn_asemp" value="Asignar Empleado" style="position:absolute;left:134px;top:168px;width:150px;height:35px;z-index:22;">
<label for="" id="Label9" style="position:absolute;left:73px;top:16px;width:295px;height:24px;line-height:24px;z-index:23;">Registrar Empleado en Local</label>
<input type="text" id="txt_empnom" style="position:absolute;left:144px;top:70px;width:240px;height:25px;z-index:24;" name="txt_empnom" value="" spellcheck="false">
<input type="hidden" id="txt_empid" style="position:absolute;left:346px;top:70px;width:68px;height:25px;z-index:25;" name="txt_empid" value="" spellcheck="false">
<input type="text" id="txt_emplocnom" style="position:absolute;left:144px;top:116px;width:240px;height:25px;z-index:26;" name="txt_emplocnom" value="" spellcheck="false">
<input type="hidden" id="txt_empidloc" style="position:absolute;left:349px;top:116px;width:62px;height:16px;z-index:27;" name="txt_emplocid" value="" spellcheck="false">
</form>
</div>

<div id="myModal4" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close3">CERRAR</span>
         <script>
        var modal4 = document.getElementById("myModal4");      
        var cerrar = document.getElementsByClassName("close3")[0];
        
        cerrar.onclick = function() {
          modal4.style.display = "none";
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
                                        db.query.execute("select identidad, nombre from usuarios WHERE rol = 'Empleado'");
                                        ResultSet usuemp = db.query.getResultSet();
                                        
                                        while (usuemp.next()) {

                                            identidad = usuemp.getString(1);
                                            nombre = usuemp.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=identidad%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="empusu('<%=identidad%>','<%=nombre%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table> 
        
  </div>
</div>
<div id="myModal5" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close4">CERRAR</span>
         <script>
        var modal5 = document.getElementById("myModal5");      
        var cerrar = document.getElementsByClassName("close4")[0];
        
        cerrar.onclick = function() {
          modal5.style.display = "none";
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
                                        ResultSet locemp = db.query.getResultSet();
                                        
                                        
                                        while (locemp.next()) {

                                            id = Integer.parseInt(locemp.getString(1));
                                            nombre = locemp.getString(2);
                                            
                                    %>
                                    <tr>
                                        <td><%=id%></td>
                                        <td><%=nombre%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="emplocaldatos('<%=id%>','<%=nombre%>')"/></td>     
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>         
  </div>
</div>

          <div style="position:absolute;top:350px;left:230px;">
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
                                        <td><input type="button" value="Eliminar" 
                                        onclick="window.location='Locales.jsp?emp_id1=<%=locempid%>&emp_id2=<%=empid%>&p_editar3=1'"/></td>
                                    </tr>
                                    <%  }%>
                                </tbody>
      </table>
     </div>                       
                                

</div>
</div>
<div id="wb_ResponsiveMenu1" style="position:absolute;left:4px;top:0px;width:1560px;height:79px;z-index:56;">
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