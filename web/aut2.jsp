

<%@page import="java.sql.*"%> 
<%@page import="database.*"%>
<%  
           Dba db = new Dba();
           db.Conectar();
           db.query.execute("select * FROM Gerente_Local");
           ResultSet rs=db.query.getResultSet();
           
           String idloc;
           while(rs.next()){ 
            if(session.getAttribute("s_id").equals(rs.getString(1))){
                        
                        idloc = rs.getString(2);
                        session.setAttribute("s_loc", idloc);
                    }          
           }
           
           db.desconectar();        
        %>