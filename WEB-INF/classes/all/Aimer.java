package all;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/aimer")
public class Aimer extends HttpServlet{ 
    public void service( HttpServletRequest req, HttpServletResponse res ) 
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();
	
   String m = req.getParameter("user");
	int idpub = Integer.parseInt(req.getParameter("id"));
	String requete ="insert into jaime values(?, (SELECT idutilisateur FROM utilisateurs WHERE email=?));";
	Connection cc = c.getConnection();
	PreparedStatement ps = cc.prepareStatement(requete);
	ps.setInt(1, idpub);
	ps.setString(2, m);
   ps.executeQuery();
   c.close();
	}catch(Exception e){
	    out.println("<h2>" + e + "</h2>");
	    c.close();
	    //out.println("Vous avez déjà aimé");
	}
   }
}