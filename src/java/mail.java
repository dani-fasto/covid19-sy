
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ZORO
 */
public class mail {
    
    
    public boolean sendmail(String to ,String subject , String msg_body){
        
       String from = "covid19.sy.sy";
       String pass = "COVID19.SY.SY##";
       boolean mail_status = false;
       Properties props =new Properties();
       props.put("mail.smtp.host","smtp.gmail.com");
       props.put("mail.smtp.socketFactory.port","465");
       props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
       props.put("mail.smtp.auth","true");
       
       myauth auth = new myauth(from, pass);
       auth.getPasswordAuthentication();
       props.put("mail.debug","true");
       
       Session ses = (Session) Session.getInstance(props,auth);
       
        try {
            
            Message msg = new MimeMessage(ses);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] addresses ={new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, addresses);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setText(msg_body);
            Transport.send(msg);
            mail_status=true;
           
            
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
       
       return mail_status;
        
        
        
    }
    
}
