
import static java.io.FileDescriptor.out;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class security extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginDao dao =new LoginDao();
        
        if(dao.check(username, password))
        {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            
            response.sendRedirect("admin_area.jsp");
        
        }
        
        else{
            
            response.sendRedirect("security_failed.jsp");
            
        
        }
        
        
        
        
        
        
        
        
        
    }

}
