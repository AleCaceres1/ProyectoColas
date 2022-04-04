<%@page import="java.sql.*"%> 
<%@page import="database.*"%>
<%  
           Dba db = new Dba();
           db.Conectar();
           db.query.execute("select * from Empleado_Area");
           
           ResultSet rs=db.query.getResultSet();

           String idloc,idarea;
           while(rs.next()){ 
            if(session.getAttribute("s_id").equals(rs.getString(3))){
                        idarea = rs.getString(1);
                        idloc = rs.getString(2);
                        session.setAttribute("s_area", idarea);
                        session.setAttribute("s_loc", idloc);
                    }          
           }
           db.query.execute("select * from puestos");
           ResultSet rs2=db.query.getResultSet();
           while(rs2.next()){
               if(session.getAttribute("s_id").equals(rs2.getString(4))){
                   session.setAttribute("s_pues", Integer.parseInt(rs2.getString(1)));
               }
           }
           
           db.desconectar();        
        %>
