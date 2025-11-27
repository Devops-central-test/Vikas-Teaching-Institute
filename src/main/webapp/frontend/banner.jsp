<%@page import="java.sql.*"%>
<%@page import="db.connect_db"%>

<%
    String bannerCtx = request.getContextPath();
%>

<!-- JSSOR Slider JS -->
<script src="<%= ctx %>/js/jquery-1.11.3.min.js"></script>
<script src="<%= ctx %>/js/jssor.slider-27.5.0.min.js"></script>

<script>
    jQuery(document).ready(function ($) {

        var jssor_1_SlideoTransitions = [
            [{b:-1,d:1,o:-0.7}],
            [{b:900,d:2000,x:-379,e:{x:7}}],
            [{b:900,d:2000,x:-379,e:{x:7}}],
            [{b:-1,d:1,o:-1,sX:2,sY:2},
             {b:0,d:900,x:-171,y:-341,o:1,sX:-2,sY:-2,e:{x:3,y:3,sX:3,sY:3}},
             {b:900,d:1600,x:-283,o:-1,e:{x:16}}]
        ];

        var options = {
            $AutoPlay: 1,
            $SlideDuration: 1000,
            $SlideEasing: $Jease$.$OutQuint,
            $CaptionSliderOptions: { $Class: $JssorCaptionSlideo$, $Transitions: jssor_1_SlideoTransitions },
            $ArrowNavigatorOptions: { $Class: $JssorArrowNavigator$ },
            $BulletNavigatorOptions: { $Class: $JssorBulletNavigator$ }
        };

        var slider = new $JssorSlider$("jssor_1", options);

        function ScaleSlider() {
            let container = slider.$Elmt.parentNode;
            let containerWidth = container.clientWidth;
            if (containerWidth) slider.$ScaleWidth(Math.min(containerWidth, 1300));
            else setTimeout(ScaleSlider, 30);
        }

        ScaleSlider();
        $(window).on("load resize orientationchange", ScaleSlider);
    });
</script>

<style>
    .jssorl-009-spin img { animation: spin 1.6s linear infinite; }
    @keyframes spin { 100% { transform: rotate(360deg); } }

    .jssorb032 .i .b { fill:#fff; stroke:#000; opacity:.7; }
    .jssora051 .a { stroke:#fff; stroke-width:360; }
</style>

<!-- SLIDER HTML -->
<div id="jssor_1"
     style="position:relative;margin:auto;width:1300px;height:500px;overflow:hidden;visibility:hidden;">

    <!-- LOADING -->
    <div data-u="loading" class="jssorl-009-spin"
         style="position:absolute;top:0;left:0;width:100%;height:100%;
                text-align:center;background-color:rgba(0,0,0,0.7);">

        <img style="margin-top:-19px;top:50%;position:relative;width:38px;height:38px;"
             src="<%= ctx %>/img/spin.svg" />
    </div>

    <!-- SLIDES -->
    <div data-u="slides"
         style="cursor:default;position:relative;top:0;left:0;width:1300px;height:500px;overflow:hidden;">

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
                 src="<%= ctx %>/admin/images/<%= rs.getString("title") %>" />
        </div>
        <% } %>

    </div>

    <!-- BULLETS -->
    <div data-u="navigator" class="jssorb032"
         style="position:absolute;bottom:12px;right:12px;"
         data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">

        <div data-u="prototype" class="i" style="width:16px;height:16px;">
            <svg viewBox="0 0 16000 16000"
                 style="width:100%;height:100%;">
                <circle class="b" cx="8000" cy="8000" r="5800"></circle>
            </svg>
        </div>
    </div>

    <!-- ARROWS -->
    <div data-u="arrowleft" class="jssora051"
         style="width:65px;height:65px;top:0;left:25px;"
         data-autocenter="2">

        <svg viewBox="0 0 16000 16000"
             style="width:100%;height:100%;">
            <polyline class="a"
                      points="11040,1920 4960,8000 11040,14080"></polyline>
        </svg>

    </div>

    <div data-u="arrowright" class="jssora051"
         style="width:65px;height:65px;top:0;right:25px;"
         data-autocenter="2">

        <svg viewBox="0 0 16000 16000"
             style="width:100%;height:100%;">
            <polyline class="a"
                      points="4960,1920 11040,8000 4960,14080"></polyline>
        </svg>

    </div>

</div>
