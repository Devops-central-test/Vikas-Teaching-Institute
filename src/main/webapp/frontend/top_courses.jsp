<%@page import="db.connect_db"%>
<%@page import="java.sql.*"%>

<%
    String ctx = request.getContextPath();
%>

<style>
h3.a {
  white-space: nowrap;
  overflow: hidden;
  word-break: break-all;
}
</style>

<%
    Connection con41 = new connect_db().getConnection();

    PreparedStatement ps42 = con41.prepareStatement(
        "SELECT * FROM courses ORDER BY id DESC LIMIT 4"
    );

    ResultSet rs42 = ps42.executeQuery();
%>

<div class="colorlib-classes">
    <div class="container">
        <div class="row">
            <div class="col-md-12 colorlib-heading center-heading text-center animate-box">
                <h1 class="heading-big">Top Courses</h1>
                <h2>Top Courses</h2>
            </div>
        </div>

        <div class="row">
            <% while(rs42.next()) { %>

            <div class="col-md-4 animate-box">
                <div class="classes">

                    <div class="classes-img"
                         style="background-image: url('<%= ctx %>/images/<%= rs42.getString("image") %>'); width: 341px;">
                    </div>

                    <div class="wrap">
                        <div class="desc">
                            <span class="teacher"><%= rs42.getString("cname") %></span>
                            <h3 class="a"><%= rs42.getString("description") %></h3>
                        </div>

                        <div class="pricing">
                            <p>
                                <span class="price">&#8377; <%= rs42.getString("price") %></span>
                                <button class="btn-cta" style="float: right">
                                    <a href="<%= ctx %>/frontend/courses-single.jsp?id=<%= rs42.getString("id") %>">
                                        <span>Read More</span>
                                    </a>
                                </button>
                            </p>
                        </div>

                    </div>

                </div>
            </div>

            <% } %>
        </div>

    </div>
</div>
