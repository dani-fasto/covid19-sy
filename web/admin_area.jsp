<%-- 
    Document   : admin_area
    Created on : Jun 7, 2020, 3:34:28 AM
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
    
    <title>مهام مدير النظام</title>

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
 

  <body>
      
      <%
          response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
          response.setHeader("Pragma", "no-cashe");
          response.setHeader("Expires", "0");
          
          if(session.getAttribute("username")==null)
          { 
              response.sendRedirect("security.jsp");
          }
          if(request.getParameter("submit")!=null)
    {
        
     

     
     
     
     int infection= Integer.parseInt(request.getParameter("infection"));
     int healing= Integer.parseInt(request.getParameter("healing"));
     int death= Integer.parseInt(request.getParameter("death"));
     
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
     pst=con.prepareStatement("update covid_stat set  infection=?, healing=? ,death=? where id=1 ");
     
     pst.setInt(1,infection);
     pst.setInt(2,healing);
     pst.setInt(3,death);

     pst.executeUpdate();
     
     %>

     <script>
      alert("تم تحديث احصائيات الفيروس  بنجاح ! ");
       
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
      <h1 style="padding: 2.5%;">: مهام مدير النظام</h1>
    </div>
    <br />
   <div class="container">
    <div class="tab">
      <button
        class="tablinks text-center"
        onclick="openCity(event, 'healthy')"
        id="defaultOpen"
      >
        ادارة المراكز الصحية
      </button>
      <button class="tablinks text-center" onclick="openCity(event, 'qarantina')">ادارة مراكز الحجر الصحي </button>
      <button class="tablinks text-center" onclick="openCity(event, 'evaluate')">تقييم طلبات المواطنين</button>
      <button class="tablinks text-center" onclick="openCity(event, 'statistics')">تعديل احصائيات الفيروس</button>

    </div>

    <div id="healthy" class="tabcontent">
        <br>
      <h5 style="text-align: center;">:جدول المراكز الصحية و توزعها في سورية  </h5>
       <br>
        <a href="healthy_centers_t.jsp"><h6 style="text-align: center;">انقر هنا</h6></a>

      
    </div>

    <div id="qarantina" class="tabcontent">
        <br>
        <h5 style="text-align: center;">:جدول مراكز الحجر و توزعها في سورية  </h5>
        <br>
        
        <a href="qarantina_centers_t.jsp"><h6 style="text-align: center;">انقر هنا</h6></a>
        
          
        </div>

    <div id="evaluate" class="tabcontent">
        <br>
        <h5 style="text-align: center;">:جدول تقييم طلبات المواطنين</h5>
        <br>
        <h6 style="text-align: center;"> :لعرض جدول تقييم طلبات المواطنين انقر على الرابط </h6>
        <br>
        <a href="request.jsp"><h6 style="text-align: center;">هنا</h6></a>
    </div>

    <div id="statistics" class="tabcontent">
        <br>
        <h5 style="text-align: center;">:تعديل احصائيات الفيروس  </h5>
        
        <div class="counter">
          <div class="container">
            <form action="" method="post">
              <div class="form-group">
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
                      <input type="number" value=<%=rs.getInt("death") %> name="death" class="form-control" onclick="death_fun(this.value)" id="death_con" style="margin-bottom: 25px;text-align: center"><p class="counter-death" id="death_num"> </p>
                      <p class="employee-p" >الوفيات</p>
                  </div>
              </div>
              
              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                      <div class="healing">
                        <input type="number" value=<%=rs.getInt("healing") %> name="healing" class="form-control" onclick="healing_fun(this.value)" id="healing_con" style="margin-bottom: 25px;text-align: center"><p class="counter-healing" id="healing_num"> </p>
                          <p class="healing-p">الشفاء</p>
                      </div>
                  </div>
  
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                      <div class="infection">
                        <input type="number" value=<%=rs.getInt("infection") %> name="infection" class="form-control" onclick="infection_fun(this.value)"id="infection_con" style="margin-bottom: 25px;text-align: center"><p class="counter-infection" id="infection_num"> </p>
                          <p class="infection-p">الاصابات</p>
                      </div>
                  </div>
                
                
                  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                      <div class="total">
                          <input type="number" disabled value=<%=rs.getInt("death")+rs.getInt("healing")+rs.getInt("infection") %> name="total" class="form-control"  onclick="total_fun(this.value)"id="total_con" style="margin-bottom: 25px;text-align: center"><p class="counter-total" id="total_num"> </p>
                          <p class="total-p">الاجمالي</p>
                      </div>
                  </div>
                   <%
                      }
                   %>

                  <div class="row">
                 
                    <div class="col-sm-4">
                        <button type="submit" name="submit" id="save" class="btn btn-primary" style="margin-right: -740px;margin-top: -64px;"><i class="fa fa-save"></i> حفظ</button>
                    </div>
                 </div>
      
                  
      
                  
      
                  
              </div>
            </div>
            </form>
          </div>
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
    <script src="jquery_add_row/jquery.min.js"></script>
    <script src="jquery_add_row/popper.min.js"></script>
    <script src="/jquery_add_row/bootstrap.min.js"></script>
    <script src="/fontawesome/js/all.js"></script>
    

    <!--javascript files and functions-->

<!--script for tab list show-->
    <script>
      function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
      }

      // Get the element with id="defaultOpen" and click on it
      document.getElementById("defaultOpen").click();
    </script>
    <!--script for tab list show-->
    
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
<!--script for add row in table-->
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        var actions = $("table td:last-child").html();
        // Append table with add row form on add new button click
        $(".add-new").click(function(){
            $(this).attr("disabled", "disabled");
            var index = $("table tbody tr:last-child").index();
            var row = '<tr>' +
                '<td><input type="text" class="form-control" name="serial" id="serial"></td>' +
                '<td><input type="text" class="form-control" name="name" id="name"></td>' +
                '<td><input type="text" class="form-control" name="lat" id="lat"></td>' +
                '<td><input type="text" class="form-control" name="long" id="long"></td>' +
                '<td><input type="text" class="form-control" name="address" id="address"></td>' +
                '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
                '<td>' + actions + '</td>' +
            '</tr>';
            $("table").append(row);		
            $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
            $('[data-toggle="tooltip"]').tooltip();
            
        });
        // Add row on add button click
        $(document).on("click", ".add", function(){
            var empty = false;
            var input = $(this).parents("tr").find('input[type="text"]');
            input.each(function(){
                if(!$(this).val()){
                    $(this).addClass("error");
                    empty = true;
                } else{
                    $(this).removeClass("error");
                }
            });
            $(this).parents("tr").find(".error").first().focus();
            if(!empty){
                input.each(function(){
                    $(this).parent("td").html($(this).val());
                });			
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").removeAttr("disabled");
                
                
            }		
        });
        // Edit row on edit button click
        $(document).on("click", ".edit", function(){		
            $(this).parents("tr").find("td:not(:last-child)").each(function(){
                $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
            });		
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new").attr("disabled", "disabled");
        });
        // Delete row on delete button click
        $(document).on("click", ".delete", function(){
            $(this).parents("tr").remove();
            $(".add-new").removeAttr("disabled");
        });
    });
    </script>


<script>

  function death_fun(val){
  document.getElementById("death_num").innerHTML=val;
  }
  
  function healing_fun(val){
  document.getElementById("healing_num").innerHTML=val;
  }

  function infection_fun(val){
  document.getElementById("infection_num").innerHTML=val;
  }

  function total_fun(val){
  document.getElementById("total_num").innerHTML=val;
  }


</script>

<!--script for add row in table-->




















  </body>
</html>
