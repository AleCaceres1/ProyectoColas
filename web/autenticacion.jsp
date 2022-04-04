
<%@page import="java.sql.*"%> 
<%@page import="database.*"%>
<%  
           Dba db = new Dba();
           db.Conectar();
           db.query.execute("select identidad, usuario, pass, rol from usuarios ");
           ResultSet rs=db.query.getResultSet();
           String centinela="n";
           String id;
           while(rs.next()){ 
            if(request.getParameter("txt_usu").equals(rs.getString(2) )  &&
            request.getParameter("txt_con").equals(rs.getString(3))){
                        centinela="s";
                        id = rs.getString(1);
                if( rs.getString(4).equals("Admin")){
                  session.setAttribute("s_id", id);
                  session.setAttribute("s_rol", "Admin");
                  }else if(rs.getString(4).equals("Gerente")){
                  session.setAttribute("s_id", id);
                  session.setAttribute("s_rol", "Gerente");
                  }else if(rs.getString(4).equals("Empleado")){
                  session.setAttribute("s_id", id);
                  session.setAttribute("s_rol", "Empleado");
                  }             
                    }          
           }       
           if(centinela.equals("s")){
            //guardar variables de session
            session.setAttribute("s_usu", request.getParameter("txt_usu"));
            session.setAttribute("s_con", request.getParameter("txt_con"));        
            //llamar jsp correspondiete desde linea de comando
            request.getRequestDispatcher("principal.jsp").forward(request, response);
           }
           else{
               
               request.getRequestDispatcher("index.jsp").forward(request, response);
           }
           
           db.desconectar();        
        %>