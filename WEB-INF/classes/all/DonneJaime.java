package all;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/aimer")
public class Aimer extends HttpServlet{ 
    public abstract void service( HttpServletRequest req, HttpServletResponse res ) 
	throws ServletException, IOException, SQLException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	String requete1 ="select count(*) as nbjaime from jaime where publi_id=?;";
	PreparedStatement ps1 = cc.prepareStatement(requete1);
	ps1.setInt(1, idpub);
   ResultSet rs = ps1.executeQuery();
	if(rs.next()){
		out.println(rs.getString("nbjaime") + " j'aime");	
	}	
	c.close();	   	
	
	}catch(Exception e){
	    out.println("<h2>" + e + "</h2>");
	    //out.println("Vous avez déjà aimé");
	}
   }
}
