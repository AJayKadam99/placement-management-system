<%-- 
    Document   : index
    Created on : Oct 2, 2019, 5:42:44 PM
    Author     : DEEPAK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            session.setAttribute("applied", null);
            response.sendRedirect("login.jsp");%>
    </body>
</html>
