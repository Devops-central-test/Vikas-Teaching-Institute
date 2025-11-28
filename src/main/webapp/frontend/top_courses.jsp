<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>

<style>
.card-img {
    width: 100%;
    height: 220px;
    background-size: cover;
    background-position: center;
}
</style>


<%
    Connection con = new connect_db().getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM courses ORDER BY id DESC LIMIT 4"
    );
    ResultSet rs = ps.executeQuery();
%>

<div class="colorlib-classes">
    <div class="container">
        <div class="row">
            <div class="col-md-12 colorlib-heading text-center animate-box">
                <h1 class="heading-big">Top Courses</h1>
                <h2>Top Courses</h2>
            </div>
        </div>

        <div class="row">

            <% while (rs.next()) { %>

            <div class="col-md-3 animate-box">
                <div class="classes">

                    <!-- IMAGE -->
                    <div class="classes-img card-img"
                         style="background-image:url('<%= request.getContextPath() %>/admin/images/<%= rs.getString("image") %>');">
                    </div>

                    <div class="wrap">
                        <div class="desc">
                            <!-- FIX: Correct column for course title -->
                            <h3 class="a"><%= rs.getString("cname") %></h3>
                        </div>

                        <div class="pricing" style="height:37px;">
                            <button class="btn btn-default" style="float:right;margin-top:-16px;">
                                <a href="<%= request.getContextPath() %>/frontend/course_category.jsp?id=<%= rs.getString("id") %>">
                                    Read More
                                </a>
                            </button>
                        </div>
                    </div>

                </div>
            </div>

            <% } %>

        </div>

    </div>
</div>
