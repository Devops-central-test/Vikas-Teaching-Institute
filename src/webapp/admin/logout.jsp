<%-- 
    Document   : logout
    Created on : Dec 22, 2018, 10:35:02 AM
    Author     : vikas upadhyay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% session.removeAttribute("user1");
        session.removeAttribute("email1");
        session.removeAttribute("user2");
        session.removeAttribute("email2");
        out.println("<script type=\"text/javascript\">");
out.println("alert('please login')");
out.println("window.location.href='adminlogin.jsp'");
out.println("</script>");
        
        %>
    </body>
</html>
