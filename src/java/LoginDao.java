
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginDao {
    
    String sql = "select * from login where username=? and password=?";
    String url= "jdbc:mysql://localhost:3306/covid19";
    String Username="root";
    String Password="root";
    
    public boolean check(String username1, String password1){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(url,Username,Password);
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username1);
            st.setString(2, password1);
            ResultSet rs =st.executeQuery();
            
            if(rs.next())
            {
                return true;
            }
            
        } catch (Exception e) {
            e.getMessage();
        }
        
        
        return false;
        
    }
     
    
    
}
