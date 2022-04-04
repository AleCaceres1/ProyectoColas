<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<!doctype html>
<jsp:include page="procedimientos.jsp"/>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<meta name="generator" content="WYSIWYG Web Builder 16 - http://www.wysiwygwebbuilder.com">
<link href="css/Proyecto.css" rel="stylesheet">
<link href="css/Reg_Clientes.css" rel="stylesheet">
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/data-table/bootstrap-table.css">
<link rel="stylesheet" href="css/data-table/bootstrap-editable.css">
<link rel="stylesheet" href="css/modal.css">
<script src="js/Metodos.js"></script>
</head>
<body>
<div id="container">
<div id="wb_Image1" style="position:absolute;left:33px;top:21px;width:53px;height:53px;z-index:0;">
<a href="index.jsp"><img src="images/Regresar.png" id="Image1" alt=""></a></div>
<div id="wb_Text1" style="position:absolute;left:99px;top:38px;width:250px;height:19px;z-index:1;">
<span href="index.jsp" style="color:#000000;font-family:Arial;font-size:17px;"><em>Regresar al Menú</em></span></div>

<div id="wb_Form1" style="position:absolute;left:169px;top:25px;width:1149px;height:801px;z-index:17;">
<form name="Fcliente" method="post" action="Reg_Clientes.jsp">
<div id="wb_Text1" style="position:absolute;left:355px;top:47px;width:439px;height:37px;z-index:0;">
<span style="color:#000000;font-family:'Lucida Console';font-size:37px;">REGISTRO DE CLIENTE</span></div>
<label for="" id="Label1" style="position:absolute;left:356px;top:115px;width:91px;height:21px;line-height:21px;z-index:1;">Identidad:</label>
<input type="text" id="txt_id" style="position:absolute;left:473px;top:116px;width:229px;height:25px;z-index:2;" name="txt_id" value="" spellcheck="false" placeholder="Ingrese su numero de identidad" maxlength="15" onkeypress="edadcliente()">
<label for="" id="Label2" style="position:absolute;left:367px;top:156px;width:69px;height:30px;line-height:30px;z-index:3;">Nombre: </label>
<input type="text" id="txt_nom" style="position:absolute;left:473px;top:162px;width:401px;height:25px;z-index:4;" name="txt_nom" value="" spellcheck="false" placeholder="Ingrese su nombre">
<label for="" id="Label3" style="position:absolute;left:339px;top:212px;width:97px;height:21px;line-height:21px;z-index:5;">Preferencia:</label>
<select name="cb_pref" size="1" id="Combobox1" style="position:absolute;left:473px;top:212px;width:211px;height:28px;z-index:6;">
<option>General</option>
<option>Discapacidad Fisica</option>
<option>Estado de Embarazo</option>
</select>
<label for="" id="Label4" style="position:absolute;left:300px;top:318px;width:154px;height:21px;line-height:21px;z-index:7;">Area seleccionada:</label>
<input type="text" id="txt_nomloc" style="position:absolute;left:473px;top:268px;width:201px;height:25px;z-index:8;" name="txt_nomloc" value="" spellcheck="false" placeholder="Seleccione un local en la tabla">
<input type="text" id="txt_idloc" style="position:absolute;left:712px;top:268px;width:86px;height:25px;z-index:9;" name="txt_idloc" value="" spellcheck="false">
<input type="submit" id="Button1" name="btn_cita" value="Registar Cita" style="position:absolute;left:537px;top:410px;width:129px;height:44px;z-index:10;">
<input type="text" id="txt_edad" style="position:absolute;left:732px;top:116px;width:86px;height:25px;z-index:11;" name="txt_edad" value="" spellcheck="false">
<label for="" id="Label5" style="position:absolute;left:300px;top:268px;width:154px;height:21px;line-height:21px;z-index:12;">Local seleccionado: </label>
<input type="text" id="txt_nomar" style="position:absolute;left:473px;top:319px;width:201px;height:25px;z-index:13;" name="txt_nomarea" value="" spellcheck="false" placeholder="Seleccione un area en la tabla">
<input type="text" id="txt_idar" style="position:absolute;left:712px;top:319px;width:86px;height:25px;z-index:14;" name="txt_idarea" value="" spellcheck="false">
<input type="button" id="Button2" name="btncliloc" value="Locales y areas" style="position:absolute;left:828px;top:262px;width:200px;height:100px;z-index:15;" onclick="cliarealocal()">

</form>
</div>    
<div id="myModal20" class="modal" style="z-index: 101">  
  <div class="modal-content" style="width: 100%;height: 100%;z-index: 100">
    <span class="close">CERRAR</span>
         <script>
        var modal20 = document.getElementById("myModal20");      
        var cerrar = document.getElementsByClassName("close")[0];
        
        cerrar.onclick = function() {
          modal20.style.display = "none";
        } 
        </script>
        
       <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
           data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
        <thead>
                                    <tr>

                                        <th data-field="idloc">ID LOCAL</th>
                                        <th data-field="nomloc" data-editable="false">NOMBRE LOCAL</th>
                                        <th data-field="idarea">ID AREA</th>
                                        <th data-field="nomarea" data-editable="false">NOMBRE AREA</th>
                                        <th data-field="operacion" data-editable="false">OPERACION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        //Cargar datos a la tabla locales
                                        Dba db = new Dba();
                                        db.Conectar();
                                        db.query.execute("SELECT area.id_local, locales.loc_nom, "
                                                       + "area.id_area, area.nombre "
                                                       + "FROM area "
                                                       + "INNER JOIN locales ON "
                                                       + "locales.id_local = area.id_local ");
                                        ResultSet locarea = db.query.getResultSet();
                                        
                                        int idl,ida;
                                        String noml,noma;
                                        
                                        while (locarea.next()) {

                                            idl = Integer.parseInt(locarea.getString(1));
                                            noml = locarea.getString(2);
                                            ida = Integer.parseInt(locarea.getString(3));
                                            noma = locarea.getString(4);
                                    %>
                                    <tr>
                                        <td><%=idl%></td>
                                        <td><%=noml%></td>
                                        <td><%=ida%></td>
                                        <td><%=noma%></td>
                                        <td><input type="button" value="Elección" 
                                                    onclick="cliarealocaldatos('<%=idl%>','<%=noml%>','<%=ida%>','<%=noma%>')"/></td>    
                                    </tr>
                                    <%  }%>
                                </tbody>
                            </table>         
  </div>
</div>


</div>
                                
                                
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