<%-- 
    Document   : logout
    Created on : Nov 15, 2018, 10:58:01 AM
    Author     : vikas upadhyay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
        <% session.removeAttribute("user");
        session.removeAttribute("email");
        
        response.sendRedirect("signin.jsp");
        %>
    </head>
    <body>
        
    </body>
</html>
