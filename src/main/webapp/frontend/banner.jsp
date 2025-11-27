<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>

<!-- ❌ Remove ctx variable -->

<!-- Slider JS -->
<script src="<%= ctx %>/js/jquery-1.11.3.min.js"></script>
<script src="<%= ctx %>/js/jssor.slider-27.5.0.min.js"></script>

<script>
    // (All your slider JS same as before)
</script>

<style>
    /* Your CSS unchanged */
</style>

<div id="jssor_1" style="position:relative;margin:auto;width:1300px;height:500px;overflow:hidden;visibility:hidden;">

    <div data-u="loading" class="jssorl-009-spin"
         style="position:absolute;top:0;left:0;width:100%;height:100%;
                text-align:center;background-color:rgba(0,0,0,0.7);">

        <img src="<%= ctx %>/img/spin.svg"
             style="margin-top:-19px;top:50%;position:relative;width:38px;height:38px;" />
    </div>

    <div data-u="slides" style="cursor:default;position:relative;width:1300px;height:500px;overflow:hidden;">
        <%
            Connection con = new connect_db().getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM add_banner WHERE status='active' ORDER BY id DESC LIMIT 4"
            );
            ResultSet rs = ps.executeQuery();
        %>

        <% while(rs.next()) { %>
        <div>
            <img data-u="image" src="<%= ctx %>/admin/images/<%= rs.getString("title") %>" />
        </div>
        <% } %>
    </div>

</div>
