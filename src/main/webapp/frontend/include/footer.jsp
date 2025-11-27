<%@page import="db.connect_db"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<body>

<%
    String c="",a="",t="",e="",ff="";
    Connection con2 = new connect_db().getConnection();
    PreparedStatement ps = con2.prepareStatement("select * from contact_info");
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        c=rs.getString("company");
        a=rs.getString("address");
        t=rs.getString("telephone");
        e=rs.getString("email");
        ff=rs.getString("fax");
    }
%>

<footer id="colorlib-footer">
    <div class="container">

        <div class="row row-pb-md">

            <div class="col-md-3 colorlib-widget">
                <h4>Contact Info</h4>
                <ul>
                    <li><%=c%><br><%=a%></li>
                    <li><a href="tel:<%=t%>">+91 <%=t%></a></li>
                    <li><a href="mailto:<%=e%>"><%=e%></a></li>
                    <li><%=ff%></li>
                </ul>
            </div>

            <div class="col-md-2 colorlib-widget"></div>

            <div class="col-md-2 colorlib-widget">
                <h4>Useful Links</h4>
                <ul>
                    <li><a href="<c:url value='/frontend/about.jsp'/>">About</a></li>
                    <li><a href="<c:url value='/frontend/courses.jsp'/>">Courses</a></li>
                    <li><a href="<c:url value='/frontend/event.jsp'/>">Events</a></li>
                    <li><a href="<c:url value='/frontend/services.jsp'/>">Services</a></li>
                    <li><a href="<c:url value='/frontend/contact.jsp'/>">Contact</a></li>
                </ul>
            </div>

            <div class="col-md-3 colorlib-widget"></div>

        </div>
    </div>

<%
    String f="",g="",i="",y="";
    PreparedStatement ps2 = con2.prepareStatement("select * from location_link");
    ResultSet rs2 = ps2.executeQuery();
    if(rs2.next()){
        f=rs2.getString("facebook");
        g=rs2.getString("google");
        i=rs2.getString("instagram");
        y=rs2.getString("youtube");
    }
%>

<div style="text-align:center">
    <a href="<%=f%>" class="fa fa-facebook"></a>
    <a href="<%=g%>" class="fa fa-google-plus"></a>
    <a href="<%=i%>" class="fa fa-instagram"></a>
    <a href="<%=y%>" class="fa fa-youtube"></a>
</div>

</footer>

</body>
</html>
