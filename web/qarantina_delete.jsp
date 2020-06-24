<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<%
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("Pragma", "no-cashe");
    response.setHeader("Expires", "0");
    
    if(session.getAttribute("username")==null)
    { 
        response.sendRedirect("security.jsp");
    }
   
    
        
     

     
     String id= request.getParameter("id");
     
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=utf8", "root", "root");
     pst=con.prepareStatement("delete from qarantina_centers_t  where id=? ");

     pst.setString(1,id);
     pst.executeUpdate();
     
     %>
     <script>
      alert("تمت حذف بيانات المركز بنجاح ! ");
                    window.location.href = "qarantina_centers_t.jsp";
     </script>
