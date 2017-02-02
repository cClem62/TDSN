package all;

import javax.mail.*;
import javax.mail.internet.*;
import javax.naming.*;
import java.io.*;
import org.apache.commons.lang.StringEscapeUtils;
import java.sql.*;    

public class Email{
    public static Boolean send(String from, String emailTo, String subject, String content){       
	try{
	    Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	    javax.mail.Session sess = (javax.mail.Session) envCtx.lookup("mail/Session");
	    Message message = new MimeMessage(sess);
	    message.setFrom(new InternetAddress(from));
	    InternetAddress to[] = new InternetAddress[1];
	    to[0] = new InternetAddress(emailTo);
	    message.setRecipients(Message.RecipientType.TO, to);
	    message.setSubject(subject);
	    message.setContent(content, "text/plain");
	    Transport.send(message);
	    return true;
	}catch(NamingException e){
	     System.out.println("<h2>"+e+"</h2>");
	     return false;
	}catch(MessagingException e){
	     System.out.println("<h2>"+e+"</h2>");
	     return false;
	}
    }
}
