<%-- 
    Document   : add_person
    Created on : Jun 7, 2020, 3:33:15 AM
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>اضافة حالة</title>

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
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet" />
    <link href="counters.css" rel="stylesheet" />
    
    <!--css files-->

    
  </head>
  <body>
      

    
   <% if (request.getCharacterEncoding() == null)
        {request.setCharacterEncoding("UTF-8");}%>
        
        
   <% if(request.getParameter("submit")!=null){ %>
 
   <%  String person_name= request.getParameter("person_name");
     String address= request.getParameter("address");
     String land_number= request.getParameter("land_number");
     String mob_number= request.getParameter("mob_number");
     String na_id= request.getParameter("na_id");
     String se_id= request.getParameter("se_id");
     String email= request.getParameter("email");
     String headache= request.getParameter("headache");
     String fever= request.getParameter("fever");
     String cough= request.getParameter("cough");
     String tired= request.getParameter("tired");
     String social= request.getParameter("social");
     String travell= request.getParameter("travell");
     %>
     
    
      <% if (person_name==null || address==null || land_number==null || mob_number==null || na_id==null || se_id==null || email==null || headache==null || fever==null || cough==null || tired==null || social==null || travell==null )
      {%>    
     
         <script>
            swal({
                 title: "فشل في تسجيل الحالة",
                 text: "الرجاء التأكد من كتابة كل المعلومات المطلوبة",
                 icon: "error",
                 button: "موافق"
                 }).then(function() {
                    window.location = "add_person.jsp";
                 });
            
         </script>
   
    <% 
        }
          else { 
    %>
    
<%
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
     pst=con.prepareStatement("INSERT INTO add_person (person_name,address,land_number,mob_number,na_id , se_id , email, headache,fever,cough,tired,social,travell) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
     pst.setString(1,person_name);
     pst.setString(2,address);
     pst.setString(3,land_number);
     pst.setString(4,mob_number);
     pst.setString(5,na_id);
     pst.setString(6,se_id);
     pst.setString(7,email);
     pst.setString(8,headache);
     pst.setString(9,fever);
     pst.setString(10,cough);
     pst.setString(11,tired);
     pst.setString(12,social);
     pst.setString(13,travell);
     pst.executeUpdate();

     
      %>

     <script>
             swal({
                 title: "تمت اضافة الحالة بنجاح",
                 text: "ستتم مراجعة حالتك من قبل الفريق الطبي و التواصل معك  ",
                 icon: "success",
                 button: "موافق"
                 }).then(function() {
                    window.location = "add_person.jsp";
                 });
      </script>
      <%
          }
      %>
      
    <%
        
        
        }

    %>
   
 
      
      
      
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
            <li class="nav-item active">
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
      <h1 style="padding: 2.5%;">نموذج تسجيل حالة</h1>
      <br />
      <h4 style="padding: 2.5%;">
        ..اذا كنت تشعر بأي أعراض تنفسية لا تتردد<br><br>
         املأ النموذج وفق الخطوات التالية لتتم متابعة
        حالتك من قبل الفريق الطبي
      </h4>
    </div>

    <br />
    <div class="container">
    <ul class="nav nav-tabs nav-justified" id="nav" role="tablist">
        <li class="nav-item" >
          <a href="#step-3" class="nav-link h4 mb-0" id="step-3-tab" data-toggle="tab" role="tab" aria-controls="step-3" aria-selected="true">الخطوة 3<br><small class="d-none d-md-inline">النشاط الاجتماعي</small></a>
        </li>
        <li class="nav-item">
          <a href="#step-2" class="nav-link h4 mb-0" id="step-2-tab" data-toggle="tab" role="tab" aria-controls="step-2" aria-selected="false">الخطوة 2<br><small class="d-none d-md-inline"> الأعراض التي تشعر بها</small></a>
        </li>
        <li class="nav-item">
          <a href="#step-1" class="nav-link h4 mb-0 active" id="step-1-tab" data-toggle="tab" role="tab" aria-controls="step-1" aria-selected="false">الخطوة 1<br><small class="d-none d-md-inline">المعلومات الشخصية</small></a>
        </li>
    </ul>
<form action="#" method="post"  >        
    <div class="tab-content" id="navContent">
        <div class="tab-pane fade pt-4 show active" id="step-1" role="tabpanel" aria-labelledby="step-1-tab">
            
            
                <div class="form-group row">
                    <div class="col-md-9">
                        <input type="text" style="display: block;text-align: center" name="person_name" id="name_text" class="form-control"   placeholder="الاسم الثلاثي"  > 
                    </div>
                    <div class="col-sm-2">
                        <label for="name" style="display: block;text-align: right;" >&nbsp;&nbsp; : الاسم</label>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-9">
                        <input type="text" style="display: block;text-align: center" name="address" id="address_text" class="form-control" placeholder=".... العنوان بالتفصيل : محافظة- حي - شارع - نقطة مميزة ان وجد" > 
                    </div>
                    <div class="col-sm-2">
                        <label for="address" style="display: block;text-align: right;" >&nbsp;&nbsp; : العنوان</label>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-9">
                        <input type="tel" style="display: block;text-align: center" name="land_number" id="land_number" class="form-control" placeholder="011-1234567" > 
                    </div>
                    <div class="col-sm-2">
                        <label for="land_number" style="display: block;text-align: right;" >&nbsp;&nbsp; : رقم الهاتف</label>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-9">
                        <input type="tel" style="display: block;text-align: center" name="mob_number" id="mob_number" class="form-control" placeholder="09********" > 
                    </div>
                    <div class="col-sm-2">
                        <label for="mob_number" style="display: block;text-align: right;" >&nbsp;&nbsp; : رقم الموبايل</label>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-9">
                        <input type="text" style="display: block;text-align: center" name="na_id" id="na_id" class="form-control" placeholder=" الرقم الوطني  الموجود على الوجه الامامي"> 
                    </div>
                    <div class="col-sm-2">
                        <label for="na_id" style="display: block;text-align: right;" >&nbsp;&nbsp; : الرقم الوطني</label>
                    </div>
                </div>
                
                <div class="form-group row">
                    <div class="col-md-9">
                        <input type="text" style="display: block;text-align: center" name="se_id" id="se_id" class="form-control" placeholder="رقم الهوية الموجود على الوجه الخلفي" > 
                    </div>
                    <div class="col-sm-2">
                        <label for="se_id" style="display: block;text-align: right;" >&nbsp;&nbsp; : رقم الهوية</label>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-9">
                        <input type="text" style="display: block;text-align: center" name="email" id="email" class="form-control" placeholder="username@domain.com " > 
                    </div>
                    <div class="col-sm-2">
                        <label for="email" style="display: block;text-align: right;" >&nbsp;&nbsp; : البريد الالكتروني</label>
                    </div>
                </div>
                <button type="button" class="btn btn-outline-primary btn-lg d-block ml-auto"   id="goto-step-2">الخطوة 2</button>

 
        
        
    </div>
    <br>
        
        <div class="tab-pane fade pt-4" id="step-2" role="tabpanel" aria-labelledby="step-2-tab">
           
            <div class="form-group row" >
                <div class="col toggle_ali">
                  <div class="custom-control custom-radio">
                    <input type="radio" id="headache_no" value="لا" name="headache" class="custom-control-input" class="headache" >
                    <label class="custom-control-label" for="headache_no">لا</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input type="radio" id="headache_yes" value="نعم" name="headache" class="custom-control-input" class="headache" >
                    <label class="custom-control-label" for="headache_yes">نعم</label>
                  </div>
                </div>
                <div class="col">
                    <label for="name" class="label_new" style="display: block;text-align: right;" >&nbsp;&nbsp; هل تشعر بالصداع : ؟ </label>
                </div>
            </div>

            <div class="form-group row">
                <div class="col toggle_ali">
                  <div class="custom-control custom-radio">
                    <input type="radio" id="fever_no" value="لا" name="fever" class="custom-control-input" >
                    <label class="custom-control-label" for="fever_no">لا</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input type="radio" id="fever_yes" value="نعم" name="fever" class="custom-control-input" >
                    <label class="custom-control-label" for="fever_yes">نعم</label>
                  </div>
                </div>
                <div class="col">
                    <label for="name" class="label_new" style="display: block;text-align: right;" >&nbsp;&nbsp; هل تعاني من الحمى : ؟ </label>
                </div>
            </div>

            <div class="form-group row">
                <div class="col toggle_ali">
                  <div class="custom-control custom-radio">
                    <input type="radio" id="cough_no" value="لا" name="cough" class="custom-control-input">
                    <label class="custom-control-label" for="cough_no">لا</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input type="radio" id="cough_yes" value="نعم" name="cough" class="custom-control-input">
                    <label class="custom-control-label" for="cough_yes">نعم</label>
                  </div>
                </div>
                <div class="col">
                    <label for="name" class="label_new" style="display: block;text-align: right;" >&nbsp;&nbsp; هل تعاني من السعال الجاف : ؟ </label>
                </div>
            </div>

            <div class="form-group row">
                <div class="col toggle_ali">
                  <div class="custom-control custom-radio">
                    <input type="radio" id="tired_no" value="لا" name="tired" class="custom-control-input">
                    <label class="custom-control-label" for="tired_no">لا</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input type="radio" id="tired_yes" value="نعم" name="tired" class="custom-control-input">
                    <label class="custom-control-label" for="tired_yes">نعم</label>
                  </div>
                </div>
                <div class="col">
                    <label for="name" class="label_new" style="display: block;text-align: right;" >&nbsp;&nbsp; هل تشعر بالوهن العام : ؟ </label>
                </div>
            </div>

            <button type="button" class="btn btn-outline-primary btn-lg d-block ml-auto"   id="goto-step-3" onclick="empty()">الخطوة 3</button>



        </div>
        <div class="tab-pane fade pt-4" id="step-3" role="tabpanel" aria-labelledby="step-3-tab">


            <div class="form-group row">
                <div class="col toggle_ali toggle_ali_social">
                  <div class="custom-control custom-radio">
                    <input type="radio" id="social_no" value="لا" name="social" class="custom-control-input">
                    <label class="custom-control-label" for="social_no">لا</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input type="radio" id="social_yes" value="نعم"  name="social" class="custom-control-input">
                    <label class="custom-control-label" for="social_yes">نعم</label>
                  </div>
                </div>
                <div class="col">
                    <label for="name" class="label_new label_new_social" style="display: block;text-align: right;" >&nbsp;&nbsp; هل خالطت أشخاص مصابين بفيروس كورونا : ؟ </label>
                </div>
            </div>
            
            <div class="form-group row">
                <div class="col toggle_ali toggle_ali_social">
                  <div class="custom-control custom-radio">
                    <input type="radio" id="travell_no" value="لا" name="travell" class="custom-control-input">
                    <label class="custom-control-label" for="travell_no">لا</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input type="radio" id="travell_yes" value="نعم"  name="travell" class="custom-control-input">
                    <label class="custom-control-label" for="travell_yes">نعم</label>
                  </div>
                </div>
                <div class="col">
                    <label for="name" class="label_new label_new_social" style="display: block;text-align: right;" >&nbsp;&nbsp; هل سافرت مؤخرا الى بلد ينتشر به الفيروس : ؟ </label>
                </div>

            </div>
            
            
            <button type="submit" name = "submit" class="btn btn-outline-primary btn-lg d-block ml-auto bt_submit"   id="submit"  > ارسال</button>
            
			
			<button type="button" class="btn btn-outline-primary btn-lg d-block ml-auto bt_back_to1"   id="go_back_to1">عودة الى الخطوة 1</button>
                                    
        </div>
      
      </div>
    </form> 
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
    
    <script src="jquery.min.js"></script>
    <script src="bootstrap.bundle.min.js"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    

    <!--javascript files and functions-->
    

    
    <script type="text/javascript">
      $(function () {
        $('#goto-step-2').on('click', function (e) {
            
          $('html, body').animate({
            scrollTop: 0
          }, 300, function() {
            $('#step-2-tab').tab('show');
          });
        })
        $('#goto-step-3').on('click', function (e) {
            if($("input[name='headache']").attr('checked')===false){
            alert('Please complete the field');
        }
         else
          $('html, body').animate({
            scrollTop: 0
          }, 1000, function() {
            $('#step-3-tab').tab('show');
          });
        })

        $('#go_back_to1').on('click', function (e) {
          $('html, body').animate({
            scrollTop: 0
          }, 1000, function() {
            $('#step-1-tab').tab('show');
          });
        })
      })
    </script>
    <script>
    $(document).ready(function() {
      /*disable non active tabs*/
      $('.nav li').not('.active').addClass('disabled');
      $('.nav li').not('.active').find('a').removeAttr("data-toggle");
      
      $('goto-step-2').click(function(){
          /*enable next tab*/
          $('.nav li.active').next('li').removeClass('disabled');
          $('.nav li.active').next('li').find('a').attr("data-toggle","tab")
      });
  });
    </script>
    
      <!--
      <script>
          $(function () {
        $('form').submit(function () {
            if ($('input[name ="headache"]').val() === "") {
                alert('من فضلك قم بتعيئة كل المعلومات المطلوبة');
                return false;
            }
        });
    })
          
          
       
          
       </script>
  -->
       <!--
       <script>
           
           function empty() {
    var x;
    x = document.getElementsByClassName("headache").value;
    if (x === "") {
        alert("من فضلك قم بتعيئة كل المعلومات المطلوبة");
        return false;
    };
}
           
           
       </script>
-->







  </body>
</html>
