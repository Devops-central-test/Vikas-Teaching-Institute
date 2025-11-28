<%@page import="db.connect_db"%>
<%@page import="java.sql.*"%>

<%
    String ctx = request.getContextPath();
%>

<!-- Jssor Script -->
<script src="<%= ctx %>/js/jquery-1.11.3.min.js"></script>
<script src="<%= ctx %>/js/jssor.slider-27.5.0.min.js"></script>

<script>
    jQuery(document).ready(function ($) {

        var jssor_1_options = {
            $AutoPlay: 1,
            $SlideDuration: 500,
            $SlideEasing: $Jease$.$OutQuint,
            $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
            },
            $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$
            }
        };

        var jssor_slider1 = new $JssorSlider$("jssor_1", jssor_1_options);

        // RESPONSIVE CODE
        function ScaleSlider() {
            var refSize = jssor_slider1.$Elmt.parentNode.clientWidth;
            if (refSize) {
                refSize = Math.min(refSize, 1300);
                jssor_slider1.$ScaleWidth(refSize);
            } else {
                window.setTimeout(ScaleSlider, 30);
            }
        }
        ScaleSlider();
        $(window).on("load resize orientationchange", ScaleSlider);
    });
</script>

<style>
    .jssorl-009-spin img {
        animation-name: jssorl-009-spin;
        animation-duration: 1.6s;
        animation-iteration-count: infinite;
        animation-timing-function: linear;
    }

    @keyframes jssorl-009-spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }
</style>

<div id="jssor_1" style="position:relative;margin:auto;width:1300px;height:500px;overflow:hidden;visibility:hidden;">

    <!-- Loading Spinner -->
    <div data-u="loading" style="position:absolute;top:0;left:0;width:100%;height:100%;text-align:center;background:rgba(0,0,0,0.7);">
        <img style="margin-top:200px;width:50px;height:50px;" src="<%= ctx %>/img/spin.svg" />
    </div>

    <!-- Slides Container -->
    <div data-u="slides" style="cursor:default;position:relative;width:1300px;height:500px;overflow:hidden;">

        <%
            Connection con = new connect_db().getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM add_banner WHERE status='active' ORDER BY id DESC LIMIT 4"
            );
            ResultSet rs = ps.executeQuery();
        %>

        <% while (rs.next()) { %>
            <div>
                <img data-u="image" 
                     src="<%= ctx %>/images/<%= rs.getString("title") %>" 
                     style="width:1300px;height:500px;" />
            </div>
        <% } %>

    </div>

</div>
