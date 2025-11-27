<%-- 
    Document   : nav
    Created on : Aug 2, 2018, 12:34:20 PM
    Author     : APTA
--%>
<%
        
        if(session.getAttribute("email1")!=null||session.getAttribute("email2")!=null){
        %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.connect_db"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
                <%
        
        if(session.getAttribute("email1")!=null){
                %>
        
 <% Connection con=new connect_db().getConnection();
PreparedStatement ps=con.prepareStatement("select * from admin_profile");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
    

%>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/<%=rs.getString("image")%>" alt=""><%=rs.getString("name")%>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="dashboard.jsp"> Profile</a></li>
                    <li>
                      <a href="edit_profile.jsp">
                        
                        <span>Settings</span>
                      </a>
                    </li>
                
                    <li><a href="logout.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

               
                    
                  </ul>
                <% } }else if(session.getAttribute("email2")!=null){%>
                <% String email2=session.getAttribute("email2").toString();
             Connection con=new connect_db().getConnection();
PreparedStatement ps=con.prepareStatement("select * from add_subadmin where email=?");
ps.setString(1, email2);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
    

%>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/<%=rs.getString("image")%>" alt=""><%=rs.getString("sname")%>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="dashboard.jsp"> Profile</a></li>
                    <li>
                      <a href="edit_profile.jsp">
                        
                        <span>Settings</span>
                      </a>
                    </li>
                
                    <li><a href="logout.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

               
                    
                  </ul>
                <% }}%>
            </nav>
          </div>
        </div>
      
    </body>
</html>
<%}
else{
out.println("<script type=\"text/javascript\">");
out.println("alert('please login')");
out.println("window.location.href='adminlogin.jsp'");
out.println("</script>");
}%>
