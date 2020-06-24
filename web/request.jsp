<%-- 
    Document   : request
    Created on : Jun 7, 2020, 3:37:04 AM
    Author     : ZORO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/ico" href="img/favicon.ico" />
    <title>جدول تقييم طلبات المواطنين</title>
    
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
    <link href="request.css" rel="stylesheet" />
    
    <!--css files-->

    

  </head>
  <body>
      
      <%
          response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
          response.setHeader("Pragma", "no-cashe");
          response.setHeader("Expires", "0");
          
          if(session.getAttribute("username")==null)
          { 
              response.sendRedirect("security.jsp");
          }
      
      
      
      %>

     
    <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
      <div class="container-fluid">
        <a class="navbar-band" href="index.jsp">
          <img src="img/flag_icon_final.png" alt="icon"
        /></a>
          <div style="margin-left: 20px ;color: white"> Welcome ${username} </div>
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
                <form action="logout" method="post">   
                  <a type="submit" onclick="document.forms[0].submit();return false;" class="nav-link" name="logout"
                >تسجيل خروج <i class="fa fa-sign-out-alt"></i
              ></a>
                </form>
            </li> 
            <li class="nav-item ">
              <a class="nav-link" href="about.jsp" 
                >حول الموقع <i class="fa fa-info-circle"></i
              ></a>
            </li>
            <li class="nav-item active">
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
      <h5 style="padding: 2.5%;">الرجاء تقييم الحالة و من ثم الضغط على زر ارسال</h5>

    </div>
    </br>
          
          

    <div class="table-responsive">
        <table class="table table-fixed table-striped table-bordered nowrap" id="table_css" class="tableBodyScroll">
            <thead>
                <tr> 
                  
                  <th >الاسم </th>
                  <th >العنوان</th>
                  <th >البريد الالكتروني </th>
                  <th >الصداع</th>
                  <th>الحمى</th>
                  <th>السعال الجاف</th>
                  <th>الوهن العام</th>
                  <th> مخالطة أشخاص مصابين</th>
                  <th> السفر مؤخرا</th>
                  <th> ارسال رسالة عبر الايميل </th>
                  
                  
                </tr>
            </thead>
            <form method="POST" action="#" id="add_person" name="add_person">
                        <% 
                            
                            
                            Connection con;
                             PreparedStatement pst;
                             ResultSet rs;
     
                            Class.forName("com.mysql.jdbc.Driver");
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
                            String query = "select * from add_person";
                            Statement st =con.createStatement();
                    
                            rs= st.executeQuery(query);
                            while(rs.next())
                            {
                               String id =rs.getString("id");
                  
                              %>
                              <tbody>
            
                                   <tr>  
                      
                                     <td><%=rs.getString("person_name") %></td>  
                                     <td><%=rs.getString("address") %> </td> 
                                     <td><%=rs.getString("email") %></td>
                                     <td><%=rs.getString("headache") %></td>
                                     <td><%=rs.getString("fever") %></td>
                                     <td><%=rs.getString("cough") %></td>
                                     <td><%=rs.getString("tired") %></td>
                                     <td><%=rs.getString("social") %></td>
                                     <td><%=rs.getString("travell") %></td>
                     
                                     <td><a href="email.jsp?id=<%=id%>" class="edit" title="ارسال" data-toggle="tooltip"><i class="fa fa-envelope-open"></i></a> </td>
                   
                                    </tr>
                                    <%
                      }
                   %>
                
          
            </tbody>
        </table>
        
    </div>
       
      
      <br><br><br>


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
    <!--javascript files and functions-->
    
    <script>
        function email(){
       
       window.location.href='email.jsp';}
      </script>

  </body>
</html>
