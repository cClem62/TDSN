package mur;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/mur")
public class Mur extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("iso-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();
	String email = req.getParameter("m");
        
	String requete ="select * from publications inner join utilisateurs on utilisateur = idUtilisateur where utilisateur=(select idUtilisateur from utilisateurs where email=?) ORDER BY date DESC;";
	Connection cc = c.getConnection();
	PreparedStatement ps = cc.prepareStatement(requete);
	ps.setString(1,email);
   ResultSet rs = ps.executeQuery();
	String xml="";
	xml +="<?xml version ='1.0' encoding='ISO-8859-1' standalone='yes' ?>\n";
	xml +="<publications>";
        while(rs.next()){
	    xml +="<publication>\n";
	    xml +="<utilisateur>" +  rs.getString("nom") + " " + rs.getString("prenom")+ "</utilisateur>\n";
	    xml +="<contenu>"+ rs.getString("contenu") +"</contenu>\n";
	    xml +="<date>"+ rs.getString("date") +"</date>\n";
	    xml +="</publication>\n";
	}
	xml +="</publications>";
        out.println(xml);
	c.close();	   
      
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	}
    }
}
