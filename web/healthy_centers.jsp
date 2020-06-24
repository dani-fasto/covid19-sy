<%-- 
    Document   : healthy_centers
    Created on : Jun 7, 2020, 3:35:11 AM
    Author     : ZORO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/ico" href="img/favicon.ico" />
    <title>المراكز الصحية</title>
    
    <!--css files-->
    
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css"
    />

    <!-- CSS only -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      rel="stylesheet"
          />
    <link href="style.css" rel="stylesheet" />
    <link href="counters.css" rel="stylesheet" />
    <link href="admin_area.css" rel="stylesheet" />
    <!--css files-->

    
  </head>
  <body onload="myMap()">
      
      <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8" user="root" password="root" />
      <sql:query var="map_healthy" dataSource="${db}" > select * from healthy_centers_t </sql:query>
      
      
      
      
      
      
      
      
      
    <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
      <div class="container-fluid">
        <a class="navbar-band" href="index.jsp">
          <img src="img/flag_icon_final.png" alt="icon"
        /></a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarResponsive"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="about.jsp" 
                >حول الموقع <i class="fa fa-info-circle"></i
              ></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="security.jsp" 
                >ادارة الموقع <i class="fa fa-users"></i
              ></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="add_person.jsp" 
                >تسجيل حالة <i class="fa fa-user-plus"></i
              ></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="qarantina_centers.jsp" 
                >مراكز الحجر الصحي <i class="fa fa-hospital"></i
              ></a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="healthy_centers.jsp" 
                >المراكز الصحية <i class="fa fa-calendar-plus"></i
              ></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.jsp" 
                >القائمة الرئيسية <i class="fa fa-home"></i
              ></a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
      <div class="landing-text text-center">
        <h1 style="padding: 2.5%;">المخابر الصحية المعتمدة و توزعها في سورية</h1>
      </div>
      <br>
      <div class="text-center">
        <div class="container">
           <div id="googleMap" style="width:100%;height:400px;"></div>
        

        </div>






        
        
        
        
        <hr>
        <br><br>
      
      </div>

    

    <footer>
      <div class="container-fluid paading">
        <div class="row text-center">
          <div class="col-md-4" style="padding-top: 8.3%;">
            <hr class="light" />
            <p>: تواصل معنا عبر</p>
            <hr class="light" />
            <br />
            <a href="http://www.facebook.com" style="color: #d5d5d5;"
              ><i class="fab fa-facebook fa-2x"></i>
            </a>
            <a
              href="http://www.google.com"
              style="padding-left: 5%; color: #d5d5d5;"
              ><i class="fab fa-google-plus fa-2x"></i>
            </a>
            <a
              href="http://www.twitter.com"
              style="padding-left: 5%; color: #d5d5d5;"
              ><i class="fab fa-twitter fa-2x"></i>
            </a>
            <a 
              href="http://www.youtube.com"
              style="padding-left: 5%; color: #d5d5d5;"
              ><i class="fab fa-youtube fa-2x"></i
            ></a>
          </div>
          <div class="col-md-4" style="padding-top: 8.3%;">
            <hr class="light" />
            <p>: أوقات العمل <i class="fa fa-clock"></i></p>
            <hr class="light" />
            <p style="padding-right: 2%; padding-top: 6%;">
              من الأحد الى الخميس من الساعة 08:00 صباحا الى 04:30 مساءا
            </p>
          </div>
          <div class="col-md-4">
            <img src="img/flag_icon_final.png" alt="icon" />
            <hr class="light" />
            <p style="padding-right: 2%;">
              العنوان : سورية - دمشق <i class="fa fa-map-marker-alt"></i>
            </p>
            <p style="padding-right: 19%;">
              covid19.sy.sy@gmail.com : الايميل <i class="fa fa-envelope"></i>
            </p>
            <p style="padding-right: 13%;">
              0963 011 222 333 444 : الهاتف <i class="fa fa-mobile-alt"></i>
            </p>
          </div>
        </div>
      </div>
    </footer>


   
    <!--- Footer -->

    <!--javascript files and functions-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      
      crossorigin="anonymous"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>

    <script type="text/javascript">
        var markers = [
            <c:forEach var ="healthy" items ="${map_healthy.rows}" >
                    [  '<c:out value="${healthy.id}" />',
                       '<c:out value="${healthy.healthy_name}" />',
                       '<c:out value="${healthy.healthy_address}" />',
                       '<c:out value="${healthy.healthy_tele}" />',
                       '<c:out value="${healthy.healthy_lat}" />',
                       '<c:out value="${healthy.healthy_long}" />'  ],
            </c:forEach>];

    
      function myMap() {
      var mapProp= {
        center:new google.maps.LatLng(34.359491,38.149242),
        zoom:7,
        panControl: true,
               zoomControl: true,
               scaleControl: true,
               mapTypeControl:true,
               streetViewControl:true,
               overviewMapControl:true,
               rotateControl:true,
               mapTypeId: google.maps.MapTypeId.HYBRID,

      };
      var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
      for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][4],markers[i][5]);
        
        var id = markers[i][0];
        var name = markers[i][1];
        var address = markers[i][2];
        var tele = markers[i][3];
        
        marker = new google.maps.Marker({
            position: position,

            icon:'healthy.png'
        });

      marker.setMap(map);
      
      var infowindow =  new google.maps.InfoWindow({
        content: ''
         }); 
         
         bindInfoWindow(marker, map, infowindow, "<p> اسم المركز : " + name + "</p>" + "</br>" +"<p> عنوان  المركز : " + address + "</p>" + "</br>" + "<p> هاتف المركز : " + tele + "</p>");
      } 
      
        function bindInfoWindow(marker, map, infowindow, html) {
                  google.maps.event.addListener(marker, 'click', function() {
                      infowindow.setContent(html);
                      infowindow.open(map, marker);
    });
} 
      
      
      
      

      }
      </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBc66NTJPjgLsQiFuQO7rUgOKs-47cEum0&callback=myMap"></script>
      
      

    <!--javascript files and functions-->



  </body>
</html>
