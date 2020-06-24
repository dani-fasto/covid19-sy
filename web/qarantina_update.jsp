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
    
    <title>تعديل بيانات المراكز الصحية </title>

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link href="style.css" rel="stylesheet" />
    <link href="counters.css" rel="stylesheet" />
    <link href="healthy_centers_t.css" rel="stylesheet" />
    
    
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
    if (request.getCharacterEncoding() == null)
        {request.setCharacterEncoding("UTF-8");}
    if(request.getParameter("submit")!=null)
    {
        
     

     
     String id= request.getParameter("id");
     String qarantina_name= request.getParameter("qarantina_name");
     String qarantina_address= request.getParameter("qarantina_address");
     String qarantina_tele= request.getParameter("qarantina_tele");
     String qarantina_lat= request.getParameter("qarantina_lat");
     String qarantina_long= request.getParameter("qarantina_long");
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
     pst=con.prepareStatement("update qarantina_centers_t set qarantina_name=?, qarantina_address=?, qarantina_tele=? ,qarantina_lat=? ,qarantina_long=? where id=? ");
     pst.setString(1,qarantina_name);
     pst.setString(2,qarantina_address);
     pst.setString(3,qarantina_tele);
     pst.setString(4,qarantina_lat);
     pst.setString(5,qarantina_long);
     pst.setString(6,id);
     pst.executeUpdate();
     
     %>

     <script>
       alert("تم تحديث بيانات المركز بنجاح ! ");
                    window.location.href = "qarantina_centers_t.jsp";
      </script>
      
      
      
      
    <%
        
        
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
            <li class="nav-item">
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
      <h5 style="padding: 2.5%;">: التعديل على بيانات المراكز الصحية </h5>
    </div>
     
    

    <div class="row" style="margin: 0px;">
 
        <div class="col-sm-4">
            <div class="container">
            <form method="POST" action="#" id="add_qarantina" name="add_qarantina">
                        <% 
                            
                            
                            Connection con;
                             PreparedStatement pst;
                             ResultSet rs;
     
                            Class.forName("com.mysql.jdbc.Driver");
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
                            String id= request.getParameter("id");
                            pst=con.prepareStatement("select * from qarantina_centers_t where id=?");
                            pst.setString(1, id);
                            rs=pst.executeQuery();
     
                            while (rs.next())
                             {
                                 %>
                
                                <div class="form-group">
                                <label> اسم المركز</label>
                                <input type="text" value="<%=rs.getString("qarantina_name") %>" name="qarantina_name" class="form-control" id="qarantina_name" placeholder="اسم المركز" required style="margin-bottom: 40px;" >
                                </div>
                                <div class="form-group">
                                <label> عنوان المركز</label>
                                <input type="text" value="<%=rs.getString("qarantina_address") %>" name="qarantina_address" class="form-control" id="qarantina_name" placeholder="عنوان المركز" size="20px" required  style="margin-bottom: 40px;">
                                </div>
                                <div class="form-group">
                                <label> هاتف المركز</label>
                                <input type="text" value="<%=rs.getString("qarantina_tele") %>" name="qarantina_tele" class="form-control" id="qarantina_name" placeholder="هاتف المركز" size="20px" required  style="margin-bottom: 40px;">
                                </div>
                                <div class="form-group">
                                <label> (احداثيات المركز (خط الطول </label>
                                <input type="text" value="<%=rs.getString("qarantina_lat") %>" name="qarantina_lat" class="form-control" id="qarantina_name" placeholder="احدائيات المركز" size="20px" required style="margin-bottom: 40px;" >
                                </div>
                                <div class="form-group">
                                <label> (احداثيات المركز (خط العرض</label>
                                <input type="text" value="<%=rs.getString("qarantina_long") %>" name="qarantina_long" class="form-control" id="qarantina_name" placeholder="احدائيات المركز" size="20px" required style="margin-bottom: 40px;" >
                                </div>
           
           
                            <% 
                           }
                         %>
              <br><br>
              
              <div class="form-group" class="form-inline">
                  <div>
                  <input  type="submit" class="btn btn-info" id="submit" name="submit" value="حفظ"> 
                  <input  type="button" class="btn btn-warning" id="reset" name="reset" style="margin-left: 30px;" value=" رجوع" onclick="back()" >
                  </div>
              </div>
              
              <br>
            </form>
         
           </div>
        </div>

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
    <script src="jquery.js" type="text/javascript"></script>
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery.validate.min.js" type="text/javascript"></script>
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
        function back(){
       
       window.location.href='qarantina_centers_t.jsp';}
      </script>
    


    <!--javascript files and functions-->

  </body>
</html>
