package all;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/donnerjaime")
public class DonneJaime extends HttpServlet{ 
    public void service( HttpServletRequest req, HttpServletResponse res ) 
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();
	int idpub = Integer.parseInt(req.getParameter("idpub"));
	String requete1 ="select count(*) as nbjaime from jaime where publi_id=?;";
	PreparedStatement ps1 = c.getConnection().prepareStatement(requete1);
	ps1.setInt(1, idpub);
   ResultSet rs = ps1.executeQuery();
	if(rs.next()){
		out.println(rs.getString("nbjaime") + " j'aime");	
	}	
	c.close();
	}catch(Exception e){
	    out.println("<h2>" + e + "</h2>");
	    c.close();
	    //out.println("Vous avez déjà aimé");
	}
   }
}
