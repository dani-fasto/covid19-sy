<%-- 
    Document   : about
    Created on : Jun 7, 2020, 3:30:12 AM
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
    <title>ارسال ايميل </title>

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
            <%
          response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
          response.setHeader("Pragma", "no-cashe");
          response.setHeader("Expires", "0");
          
          if(session.getAttribute("username")==null)
          { 
              response.sendRedirect("security.jsp");
          }
      
      
      
      %>
      
     <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8" user="root" password="root" />
     <sql:query var="rs" dataSource="${db}" >select * from healthy_centers_t </sql:query>
      
      
      
      
      
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
      <h5 style="padding: 2.5%;">الرجاء اختيار المركز الصحي المناسب و الضغط على زر ارسال </h5>

    </div>
    </br>
    
    <div class="container">
        <form method="post" action="email" id="mail" name="mail">
            <div class="row" style="margin-left: 400px">
                   <% 
                            
                            
                            Connection con;
                             PreparedStatement pst;
                             ResultSet rs;
     
                            Class.forName("com.mysql.jdbc.Driver");
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
                            String id= request.getParameter("id");
                            pst=con.prepareStatement("select * from add_person where id=?");
                            pst.setString(1, id);
                            rs=pst.executeQuery();
                            while (rs.next())
                             {
                            %>
                       <div class="col-md-4">
                           <input class="form-control" type="text" value="<%=rs.getString("email") %>"  name="email" size="10">
                       </div>
                       
                        <div class="col-md-4">
                        <label> المستقبل  </label>
                        </div>
                      
                        
                        <div class="col-sm-2">
                           <input class="form-control" type="text" value="<%=rs.getString("address") %>"  name="email" size="10">
                       </div>
                       <% 
                           }
                         %>
                       
                       <div class="col-sm-2">
                        <label> العنوان  </label>
                        </div>
                        
                        
                        
                        
            </div>
            <br>
            <div class="row" style="margin-left: 400px">
     
                       <div class="col-md-8"  >
                           
                              <select  class="custom-select" id="sel1" name="subject">
                              <C:forEach var ="data" items ="${rs.rows}" >
                                  <option value="كوفيد19-سورية : المركز الصحي  ${data.healthy_name}">كوفيد19-سورية : المركز الصحي ${data.healthy_name}</option>
                              </C:forEach>
                              </select>
                             
                       </div>
                        <div class="col-md-4" >
                        <label>أقرب مركز صحي بحسب العنوان</label>
                        </div>
            </div>
            <br>
          
                   
                       <table>
                           <tr>
                           <textarea class="form-control" rows="8" cols="8"  style="text-align: right" name="message">
                           عزيزي المواطن                     

                           تم تقييم حالتك من قبل الفريق الطبي

الرجاء التوجه الى المركز الصحي المذكور في عنوان الرسالة

                         يمكنك معرفة أماكن توزع المراكز الصحية

 من صفحة المراكز الصحية في الموقع
                           </textarea>
                           </tr>
                       </table>
            <br>
                       <table>
                         <tr>
                         <button class="btn btn-info" type="submit" style="margin-left: 500px">ارسال</button>
                         </tr>
                       </table>
                        
            
            
        </form>
        
    </div>
    
    <br>
      <br>
      <br>
    
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

  </body>
</html>
