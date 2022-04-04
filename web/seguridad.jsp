
<%
    if(session.getAttribute("s_usu")== null){
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<%
    if (request.getParameter("sesion") != null){
        session.removeAttribute("s_usu");
        session.removeAttribute("s_con");
        session.removeAttribute("s_id");
        session.removeAttribute("s_loc");
    }
    %>
