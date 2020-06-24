<%-- 
    Document   : index
    Created on : Jun 7, 2020, 3:35:39 AM
    Author     : ZORO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/ico" href="img/favicon.ico" />
    <title>كوفيد19-سورية</title>

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
    
    <!--css files-->

    
  </head>
  <body>
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
            <li class="nav-item">
              <a class="nav-link" href="healthy_centers.jsp"
                >المراكز الصحية <i class="fa fa-calendar-plus"></i
              ></a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp"
                >القائمة الرئيسية <i class="fa fa-home"></i
              ></a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
      <div id="home">
      <div class="landing-text text-center">
          <h1 style="padding: 2.5%;"><b>كورونا#</b></h1>
        <h1 style="padding: 0.2%;">خليك بالبيت_وعيك أمانك</h1>
      </div>
      
      <div class="counter">
        <div class="container">
            <div class="row">
                
                <% 
                    Connection con;
                    PreparedStatement pst;
                    ResultSet rs;
     
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
                    String query = "select * from covid_stat";
                    Statement st =con.createStatement();
                    
                    rs= st.executeQuery(query);
                    while(rs.next())
                    {
                       
                  
                    %>
                  
              
              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="death">
                    <p class="counter-death" id="index_death"><%=rs.getInt("death") %></p>
                    <p class="employee-p">الوفيات</p>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="healing">
                        <p class="counter-healing"><%=rs.getInt("healing") %></p>
                        <p class="healing-p">الشفاء</p>
                    </div>
                </div>

              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="infection">
                        <p class="counter-infection"><%=rs.getInt("infection") %></p>
                        <p class="infection-p">الاصابات</p>
                    </div>
                </div>
              
              
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="total">
                        <p class="counter-total"><%=rs.getInt("infection")+rs.getInt("healing")+rs.getInt("death") %></p>
                        <p class="total-p">الاجمالي</p>
                    </div>
                </div>
    <%
                      }
                   %>
                
    
                
    
                
            </div>
        </div>
    </div>
    </div>




    </div>
    <div class="container-fluid padding" style="background-color: lightcoral;">
      <div class="row Welcome text-center">
        <div class="col-12">
          <h4>!ما هو فيروس كورونا ؟</h4>
        </div>
      </div>
    </div>
    <br />
    <br />
    <div id="slides" class="carousel slide" data-ride="carousel">
      <ul class="carousel-indicators">
        <li data-target="#slides" data-slide-to="0" class="active"></li>
        <li data-target="#slides" data-slide-to="1"></li>
        <li data-target="#slides" data-slide-to="2"></li>
        <li data-target="#slides" data-slide-to="3"></li>
        <li data-target="#slides" data-slide-to="4"></li>
        <li data-target="#slides" data-slide-to="5"></li>
      </ul>

      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block mx-auto" src="img/corona_1.png" alt="corona_1" />
        </div>
        <div class="carousel-item">
          <img class="d-block mx-auto" src="img/corona_2.png" alt="corona_2" />
        </div>
        <div class="carousel-item">
          <img class="d-block mx-auto" src="img/corona_3.png" alt="corona_3" />
        </div>
        <div class="carousel-item">
          <img class="d-block mx-auto" src="img/corona_4.png" alt="corona_4" />
        </div>
        <div class="carousel-item">
          <img class="d-block mx-auto" src="img/corona_5.png" alt="corona_5" />
        </div>
        <div class="carousel-item">
          <img class="d-block mx-auto" src="img/corona_6.png" alt="corona_6" />
        </div>
      </div>
    </div>
    <br />
    <br />

    <div
      class="container-fluid padding"
      style="padding-top: 3%; padding-bottom: 4%;"
    >
      <div class="row Welcome text-center">
        <div class="col-12" style="background-color: cornflowerblue;">
          <h4> طرق الوقاية من فيروس كورونا &nbsp;<h6>انقر عل الصورة للتكبير</h6></h4>
          
        </div>
      </div>
    </div>
    <div class="row justify-content-center" style="padding-bottom: 10%;">
      <div class="col-md-8" style="border-style: groove;">
        <div class="row">
          <a
            href="img/1.png"
            data-toggle="lightbox"
            data-gallery="example-gallery"
            class="col-sm-4"
          >
            <img src="img/1.png" class="img-fluid" />
          </a>
          <a
            href="img/2.png"
            data-toggle="lightbox"
            data-gallery="example-gallery"
            class="col-sm-4"
          >
            <img src="img/2.png" class="img-fluid" />
          </a>
          <a
            href="img/3.png"
            data-toggle="lightbox"
            data-gallery="example-gallery"
            class="col-sm-4"
          >
            <img src="img/3.png" class="img-fluid" />
          </a>
        </div>
        <div class="row">
          <a
            href="img/4.png"
            data-toggle="lightbox"
            data-gallery="example-gallery"
            class="col-sm-4"
          >
            <img src="img/4.png" class="img-fluid" />
          </a>
          <a
            href="img/5.png"
            data-toggle="lightbox"
            data-gallery="example-gallery"
            class="col-sm-4"
          >
            <img src="img/5.png" class="img-fluid" />
          </a>
          <a
            href="img/6.png"
            data-toggle="lightbox"
            data-gallery="example-gallery"
            class="col-sm-4"
          >
            <img src="img/6.png" class="img-fluid" />
          </a>
        </div>
      </div>
    </div>


 <!--- Footer -->
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
            <a href="admin_area.html"><img src="img/flag_icon_final.png" alt="icon" /></a>
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

    <script>
      $(document).on("click", '[data-toggle="lightbox"]', function (event) {
        event.preventDefault();
        $(this).ekkoLightbox();
      });
    </script>
    


<!--javascript files and functions-->

  </body>
</html>
