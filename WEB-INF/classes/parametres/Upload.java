package parametres;

import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;
import java.lang.Object;
import db.Connexion;

@WebServlet("/servlet/upload")
@MultipartConfig(fileSizeThreshold=2097152, maxFileSize=0xA00000, maxRequestSize=52428800)
public class Upload
extends HttpServlet {
    public void service(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        Object var3_3 = null;
        Object var4_4 = null;
        try {
            HttpSession httpSession = httpServletRequest.getSession();
            String string = httpServletRequest.getServletContext().getRealPath("/") + "users/";
	    String type = httpServletRequest.getParameter("pic");
	    String email = httpServletRequest.getParameter("email");
	    String stringT="";
	    String string2="";
	     for (Part part : httpServletRequest.getParts()) {
                string2 = this.getName(part);
		if(string2.trim() !=""){

		    
	     String req1 ="";
	     if(type.equals("profil")){
		 req1 ="UPDATE utilisateurs SET photoprofil=? WHERE email=?;";
            }else{
		 	 req1 ="UPDATE utilisateurs SET photocouverture=? WHERE email=?;";
	    }
	     
	Connexion c = new Connexion();
	c.connect();      
	Connection cc = c.getConnection();
        PreparedStatement ps1 = cc.prepareStatement(req1);
	ps1.setString(1, "users/" + string2);
	ps1.setString(2, email);
        ps1.executeUpdate();
	c.close();
		    
		stringT = string + string2;
                part.write(string + string2);
		}
	     }

        httpServletResponse.sendRedirect("../images.jsp?etat=true");
        }
        catch (IOException var5_6) {
            var5_6.printStackTrace();
        }
        catch (ServletException var5_7) {
            var5_7.printStackTrace();
        }
	 catch (Exception e) {
	     System.out.println("<h1>" + e +"</h2>");
	 }
    }

    private String getName(Part part) {
        String[] arrstring;
        String string = part.getHeader("content-disposition");
        for (String string2 : arrstring = string.split(";")) {
            if (!string2.trim().startsWith("filename")) continue;
            return string2.substring(string2.indexOf("=") + 2, string2.length() - 1);
        }
        return "";
    }
}
