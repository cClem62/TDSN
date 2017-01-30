package mur;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/ajout")
public class Ajout extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	String email = req.getParameter("m");
        int idB = Integer.parseInt(req.getParameter("id"));
	
	String requete ="INSERT INTO amitiees VALUES((SELECT idutilisateur FROM utilisateurs WHERE email=?),?,?);";
	Connection cc = c.getConnection();
	PreparedStatement ps = cc.prepareStatement(requete);
	ps.setString(1,email);
	ps.setInt(2,idB);
	
	java.util.Date today = new java.util.Date();
	ps.setDate(3, new java.sql.Date(today.getTime()));
        ps.executeUpdate();

	String requete1 ="INSERT INTO amitiees VALUES(?,(SELECT idutilisateur FROM utilisateurs WHERE email=?),?);";
	PreparedStatement ps1 = cc.prepareStatement(requete1);
	ps1.setString(2,email);
	ps1.setInt(1,idB);
	ps1.setDate(3, new java.sql.Date(today.getTime()));
        ps1.executeUpdate();

	out.println("Ajouté !");
	
	c.close();	   
      
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	}
    }
}
