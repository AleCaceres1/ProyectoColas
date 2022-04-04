    
<%
    if(session.getAttribute("s_rol").equals("Gerente")){     
  %>
         <script>
      document.getElementById("imagenes").style.display = "none";
         </script>
        <script>        
        document.getElementById("usua").style.display = "none";       
        document.getElementById("bita").style.display = "none";
        document.getElementById("repor").style.display = "none";
        document.getElementById("locareas").style.display = "none";
        document.getElementById("puesto").style.display = "none";
        
        </script>  
        <script>
        
        </script>
<%        
    }else if(session.getAttribute("s_rol").equals("Empleado")){
   %>
        <script>
       document.getElementById("imagenes").style.display = "none"; 
        </script>
        <script>           
        document.getElementById("usua").style.display = "none";       
        document.getElementById("bita").style.display = "none";
        document.getElementById("repor").style.display = "none";
        document.getElementById("locareas").style.display = "none";
        document.getElementById("sucgen").style.display = "none";
        
        
        </script>
  
   <%
    }else if(session.getAttribute("s_rol").equals("Cliente")){
%>
<script>
    document.getElementById("aidloc").style.display = "none"; 
    document.getElementById("usua").style.display = "none";       
        document.getElementById("bita").style.display = "none";
        document.getElementById("repor").style.display = "none";
        document.getElementById("locareas").style.display = "none";
        document.getElementById("sucgen").style.display = "none";
        document.getElementById("puesto").style.display = "none"; 
        document.getElementById("tran").style.display = "none";
</script>
<%
    }else if(session.getAttribute("s_rol").equals("Admin")){

%>
        <script>
        document.getElementById("imagenes").style.display = "none";       
        </script>  
        <script>
        document.getElementById("aidloc").style.display = "none";    
        document.getElementById("sucgen").style.display = "none";
        document.getElementById("puesto").style.display = "none";    
        </script>
<%
}
%>

       