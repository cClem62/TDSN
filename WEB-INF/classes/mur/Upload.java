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

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import db.Connexion;

@WebServlet(value={"/servlet/upload"})
@MultipartConfig(fileSizeThreshold=2097152, maxFileSize=0xA00000, maxRequestSize=52428800)
public class Upload
extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) {
        Object var3_3 = null;
        Object var4_4 = null;
        try {
            HttpSession httpSession = httpServletRequest.getSession();
            String string = httpServletRequest.getServletContext().getRealPath("/") + "users/" + httpSession.getAttribute("user") + "/";
	   
	    for (Part part : httpServletRequest.getParts()) {
                String string2 = this.getName(part);
                part.write(string + string2);
            }

	    try{
	 	   Connexion c = new Connexion();
		   c.connect();
		   String user = req.getParameter("user");
		   String type = req.getParameter("type");
		   String requete;
		   if(type.equals("profil")){
		     requete="insert into...";
		   }else if(type.equals("couverture")){
		     requete="insert into...";
		   }
		   
		   Connection cc = c.getConnection();
		   PreparedStatement ps = cc.prepareStatement(requete);
		   ResultSet rs = ps.executeUpdate();
		   String disp;	
		   c.close();
	 	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");			
			}					    
            httpServletResponse.sendRedirect("../parametres.jsp");
        }
        catch (IOException var5_6) {
            var5_6.printStackTrace();
        }
        catch (ServletException var5_7) {
            var5_7.printStackTrace();
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
