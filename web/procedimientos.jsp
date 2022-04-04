

<%@page import="java.sql.CallableStatement"%>
<%@page import="database.Dba"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!-- CUD Usuarios -->
<!--Insertar Usuario-->
<%
    if ( request.getParameter("btn_crearusu") !=null ) {
               // String fechita = request.getParameter("txt_fecha");
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                Date fecha = formato.parse(request.getParameter("txt_fecha"));
                java.sql.Date sd = new java.sql.Date(fecha.getTime());
                
                
            String sp = "{CALL InsertarUsuarios(?,?,?,?,?,?,?,?,?)}";      
                //Nuevo Usuario
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            
            cs.setString(1,request.getParameter("txt_id"));
            cs.setString(2,request.getParameter("txt_usu"));
            cs.setString(3,request.getParameter("txt_con"));
            cs.setString(4,request.getParameter("txt_nom"));
            cs.setDate(5,sd);
            cs.setString(6,request.getParameter("txt_dir"));
            cs.setString(7,request.getParameter("txt_tel"));
            cs.setString(8,request.getParameter("txt_email"));
            cs.setString(9,request.getParameter("cb_rol"));
            cs.execute();
  
            out.print("<script>alert('El usuario se registró correctamente');</script>");
            db.desconectar();    
             
               }
%>
<!-- Actualizar Usuario -->

<%     
 //Modificar usuario en la base de datos
 if (request.getParameter("btn_modusu") != null) {
        String fechita = request.getParameter("txt_mfecha");
        String formato = "yyyy-MM-dd";
        Date fechota = new SimpleDateFormat(formato).parse(fechita);
        java.sql.Date sd = new java.sql.Date(fechota.getTime());
     
        Dba db = new Dba();
            db.Conectar();              
        String sp = "{CALL ActualizarUsuarios(?,?,?,?,?,?,?,?,?)}";      
                //Modificar Usuario                                      
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            
            cs.setString(1,request.getParameter("txt_mid"));
            cs.setString(2,request.getParameter("txt_musu"));
            cs.setString(3,request.getParameter("txt_mcon"));
            cs.setString(4,request.getParameter("txt_mnom"));
            cs.setDate(5,sd);
            cs.setString(6,request.getParameter("txt_mdir"));
            cs.setString(7,request.getParameter("txt_mtel"));
            cs.setString(8,request.getParameter("txt_memail"));
            cs.setString(9,request.getParameter("cb_mrol"));
            cs.execute();    
        
        
        db.desconectar();               
 }
%>
<!--Eliminar Usuario-->
<%
 if ( request.getParameter("eli_usu")!=null ) {
    //ELIMINAR PRODUCTO 
         
            Dba db = new Dba();
            db.Conectar();              
            String sp = "{CALL EliminarUsuarios(?)}";      
                //Eliminar Usuario                                      
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            cs.setString(1,request.getParameter("p_id"));
            cs.execute();
            db.desconectar();           
 }
%>

<!-- CUD Locales-->
<!-- Insertar Local-->
<%
if ( request.getParameter("btn_crearlocal") !=null ) {

    //Insertar local
            String sp = "{CALL InsertarLocal(?,?,?)}";      
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            
            cs.setString(1,request.getParameter("txt_locnom"));
            cs.setString(2,request.getParameter("txt_lati"));
            cs.setString(3,request.getParameter("txt_long"));
            cs.execute();
            db.desconectar();

}
%>
<!-- Actualizar Local-->
<% 
   
//Modificar Area
 if (request.getParameter("bt_modloc") != null) {

        String sp = "{CALL ActualizarLocal(?,?,?,?)}";      
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            
            cs.setInt(1, Integer.parseInt(request.getParameter("txt_id_loc")));
            cs.setString(2 , request.getParameter("txt_mlocnom"));
            cs.setString(3 , request.getParameter("txt_mlati"));
            cs.setString(4, request.getParameter("txt_mlong"));
            cs.execute();
            
            db.desconectar();
               
 }
%>
<!-- Eliminar Local-->
<%
 if ( request.getParameter("p_editar1")!=null ) {
    //ELIMINAR PRODUCTO 
         
            Dba db = new Dba();
            db.Conectar();              
            String sp = "{CALL EliminarLocal(?)}";      
                //Eliminar Usuario                                      
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            cs.setInt(1,Integer.parseInt(request.getParameter("p_id1")));
            cs.execute();
            db.desconectar();           
 }
%>

<!-- Asignar o eliminar Gerente-->
<!--Asignar-->
<%

 if (request.getParameter("btn_asigen") != null) {

        String sp = "{CALL InsertarGerente(?,?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("txt_genid"));
            cs.setInt(2,Integer.parseInt(request.getParameter("txt_genlocid")));
            cs.setString(3,"Gerente");
            cs.execute();
            db.desconectar();               
 }
%>
<%
 if ( request.getParameter("p_editar2")!=null ) {
            //out.print("<script>alert('"+request.getParameter("gen_id1")+"')</script>");
           // out.print("<script>alert('"+request.getParameter("gen_id2")+"')</script>");
            String sp = "{CALL EliminarGerente(?,?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("gen_id2"));
            cs.setInt(2,Integer.parseInt(request.getParameter("gen_id1")));
            cs.setString(3,"Empleado");
            cs.execute();
            db.desconectar();

 }
%>
<!-- Asignar o eliminar Empleado a Local-->
<!--Asignar-->
<%

 if (request.getParameter("btn_asemp") != null) {

        String sp = "{CALL InsertarEmpleadoLocal(?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("txt_empid"));
            cs.setInt(2,Integer.parseInt(request.getParameter("txt_emplocid")));
            cs.execute();
            db.desconectar();               
 }
%>

<!--Eliminar-->
<%
 if ( request.getParameter("p_editar3")!=null ) {
            //out.print("<script>alert('"+request.getParameter("gen_id1")+"')</script>");
           // out.print("<script>alert('"+request.getParameter("gen_id2")+"')</script>");
            String sp = "{CALL EliminarEmpleadoLocal(?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("emp_id2"));
            cs.setInt(2,Integer.parseInt(request.getParameter("emp_id1")));
            cs.execute();
            db.desconectar();

 }
%>
<!-- CUD Locales-->
<!-- Insertar Area-->
<%
if ( request.getParameter("btn_crearea") !=null ) {

    //Insertar area
            String sp = "{CALL InsertarArea(?,?,?)}";      
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            
            cs.setInt(1,Integer.parseInt(request.getParameter("txt_locarea")));
            cs.setString(2,request.getParameter("txt_areanom"));
            cs.setInt(3, Integer.parseInt(request.getParameter("txt_idtran")));
            cs.execute();
            db.desconectar();
}
%> 

<!-- Actualizar Area-->
<%
  if(request.getParameter("btn_modarea")!= null){
      
            String sp = "{CALL ActualizarArea(?,?,?,?)}";      
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            
            cs.setInt(1,Integer.parseInt(request.getParameter("txt_maidarea")));
            cs.setInt(2, Integer.parseInt(request.getParameter("txt_mlocarea")));
            cs.setString(3,request.getParameter("txt_mareanom"));
            cs.setInt(4, Integer.parseInt(request.getParameter("txt_midtran")));
            cs.execute();
            db.desconectar();
            
 
  }  
%>

<!-- Eliminar Area-->
<%
 if ( request.getParameter("eli_area")!=null ) {
            //out.print("<script>alert('"+request.getParameter("gen_id1")+"')</script>");
           // out.print("<script>alert('"+request.getParameter("gen_id2")+"')</script>");
            String sp = "{CALL EliminarArea(?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            
            cs.setInt(1,Integer.parseInt(request.getParameter("p_id")));
            cs.execute();
            db.desconectar();

 }
%>
<!--Insertar Empleado en Area Admin-->
<%
    if(request.getParameter("btn_areaemp") != null){
        String sp = "{CALL InsertarEmpleadoArea(?,?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("txt_empid"));
            cs.setInt(2,Integer.parseInt(request.getParameter("txt_emplocid")));
            cs.setInt(3,Integer.parseInt(request.getParameter("txt_areaid")));
            cs.execute();
            db.desconectar();
    }
    
    %>
<!--Eliminar Empleado en Area-->
<%
   if(request.getParameter("eli_emparea") != null){
       
       String sp = "{CALL EliminarEmpleadoArea(?,?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            
            cs.setString(1, request.getParameter("emp_id"));
            cs.setInt(2,Integer.parseInt(request.getParameter("idloc")));
            cs.setInt(3,Integer.parseInt(request.getParameter("idare")));
            cs.execute();
            db.desconectar();
       
   }
%>
<!--Insertar Empleado en Area-->
<%
   if(request.getParameter("btn_areaempgen") != null){
       
        String sp = "{CALL InsertarEmpleadoArea(?,?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("txt_sempid"));
            cs.setInt(2,Integer.parseInt(request.getParameter("txt_semplocid")));
            cs.setInt(3,Integer.parseInt(request.getParameter("txt_sareaid")));
            cs.execute();
            db.desconectar();
    }
%>
<!--Insertar Empleado en Area Gerente-->
<%
   if(request.getParameter("btn_mareaempgen") != null){

       
       String sp = "{CALL ActualizarEmpleadoArea(?,?,?)}";

            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("txt_msempid"));
            cs.setInt(2,Integer.parseInt(request.getParameter("txt_msemplocid")));
            cs.setInt(3,Integer.parseInt(request.getParameter("txt_msareaid")));
            cs.execute();
            db.desconectar();

}
%>
<!--Crear puesto-->
<%
    if(request.getParameter("btn_crearpuesto") != null){       
            String sp = "{CALL CrearPuestos(?,?,?,?,?)}";
       
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setInt(1, Integer.parseInt(request.getParameter("txt_pidarea")));
            cs.setInt(2, Integer.parseInt(request.getParameter("txt_pidloc")));
            cs.setString(3, request.getParameter("txt_pnomid"));
            cs.setString(4, request.getParameter("txt_puesnom"));
            cs.setString(5, "Cerrado");
            cs.execute();
            db.desconectar();

}
%>
<!--Eliminar Puestos-->
<%
    if(request.getParameter("eli_pues") != null){       
            String sp = "{CALL EliminarPuesto(?)}";
       
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setInt(1, Integer.parseInt(request.getParameter("p_id")));
            cs.execute();
            db.desconectar();

}
%>
<!--Entrar a Puesto-->
<%
    if(request.getParameter("btn_entrar") != null){       
            
            int idpuesto = (Integer) session.getAttribute("s_pues");

            String sp = "{CALL EstadoPuesto(?,?)}";
       
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setInt(1,idpuesto);
            cs.setString(2, "Abierto");
            cs.execute();
            db.desconectar();
}
%>

<!--Salir a Puesto-->
<%
    if(request.getParameter("btn_salir") != null){       
            int idpuesto = (Integer) session.getAttribute("s_pues");
           
            String sp = "{CALL EstadoPuesto(?,?)}";
       
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setInt(1, idpuesto);
            cs.setString(2, "Cerrado");
            cs.execute();
            db.desconectar();

}
%>

<!--Ingresar Cliente y generar ticket-->

<%
    if(request.getParameter("btn_cita") != null){       
            
           
            String sp = "{CALL RegistroCliente(?,?,?,?,?)}";
       
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);            
            cs.setString(1, request.getParameter("txt_id"));
            cs.setString(2, request.getParameter("txt_nom"));
            cs.setString(3, request.getParameter("cb_pref"));
            cs.setInt(4, Integer.parseInt(request.getParameter("txt_idloc")));
            cs.setInt(5, Integer.parseInt(request.getParameter("txt_idarea")));
            cs.execute();
            db.desconectar();

}
%>

<%
  if(request.getParameter("siguiente")!= null){
        //out.print("<script>alert('"+request.getParameter("tick") + request.getParameter("id") + request.getParameter("nom")
        //+ request.getParameter("disc") + request.getParameter("loc") + request.getParameter("area") + request.getParameter("fecha")+"')</script>");
        String sp = "{CALL Transcurso(?,?,?,?,?,?,?)}";
       
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            cs.setInt(1, Integer.parseInt(request.getParameter("tick")));            
            cs.setString(2, request.getParameter("id"));
            cs.setString(3, request.getParameter("nom"));
            cs.setString(4, request.getParameter("disc"));
            cs.setInt(5, Integer.parseInt(request.getParameter("loc")));
            cs.setInt(6, Integer.parseInt(request.getParameter("area")));
            cs.setString(7, request.getParameter("fecha"));
            cs.execute();
            db.desconectar(); 
  }  

%>

<%
  if(request.getParameter("finalizar")!= null){
        //out.print("<script>alert('"+request.getParameter("atick") + request.getParameter("aid") + request.getParameter("anom")
        //+ request.getParameter("adisc") + request.getParameter("aloc") + request.getParameter("aarea") + request.getParameter("fecha1")+ request.getParameter("fecha2") + "')</script>");
        
        String sp = "{CALL Tfin(?,?,?,?,?,?,?,?)}";
       
            Dba db = new Dba();
            db.Conectar();                                         
            CallableStatement cs;
            cs = db.conexion.prepareCall(sp);
            cs.setInt(1, Integer.parseInt(request.getParameter("atick")));            
            cs.setString(2, request.getParameter("aid"));
            cs.setString(3, request.getParameter("anom"));
            cs.setString(4, request.getParameter("adisc"));
            cs.setInt(5, Integer.parseInt(request.getParameter("aloc")));
            cs.setInt(6, Integer.parseInt(request.getParameter("aarea")));
            cs.setString(7, request.getParameter("fecha1"));
            cs.setString(8, request.getParameter("fecha2"));
            cs.execute();
            db.desconectar(); 
         
}  


%>