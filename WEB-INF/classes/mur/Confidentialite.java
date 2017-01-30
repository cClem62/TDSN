package mur;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/confidentialite")
public class Confidentialite extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	String email = req.getParameter("utilisateur");
 	String etat = req.getParameter("etat");
	
	String requete ="UPDATE visibilitee SET libelle=? WHERE utilisateur=(SELECT idutilisateur FROM utilisateurs WHERE email=?);";
	Connection cc = c.getConnection();
	PreparedStatement ps = cc.prepareStatement(requete);
	ps.setString(1,etat);
	ps.setString(2,email);
	
        ps.executeUpdate();
        c.close();
        res.sendRedirect("../confidentialite.jsp?etat=ok");
	     
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	     c.close();
	}
    }
}
