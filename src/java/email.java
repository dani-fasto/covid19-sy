import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class email extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getCharacterEncoding() == null)
      request.setCharacterEncoding("UTF-8");
        
        String toemail=request.getParameter("email");
        String subject=request.getParameter("subject");
        String message=request.getParameter("message");
        
        mail mail =new mail();
        boolean mail_sent = mail.sendmail(toemail, subject, message);
        
        PrintWriter out = response.getWriter();
        if (response.getCharacterEncoding() == null)
          request.setCharacterEncoding("UTF-8");
        if(mail_sent==true)
        {
            response.sendRedirect("success_mail.jsp");
            
        }
        
        else
        {
           response.sendRedirect("failed_mail.jsp");
        }
        
        
    }



}
