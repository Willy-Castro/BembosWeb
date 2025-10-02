<%-- 
    Document   : logout
    Created on : 23 set. 2025, 8:43:53?a. m.
    Author     : Pedro
--%>

<%
    // Invalida la sesión actual y redirige al login
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

