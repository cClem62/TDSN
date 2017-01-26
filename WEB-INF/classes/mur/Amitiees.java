package mur;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/amitiees")
public class Amitiees extends HttpServlet{
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
        
	String requete ="SELECT * FROM amitiees AS a JOIN utilisateurs AS u ON u.idUtilisateur = a.utilisateurB WHERE utilisateurA =(SELECT idutilisateur FROM utilisateurs WHERE email=?);";
	Connection cc = c.getConnection();
	PreparedStatement ps = cc.prepareStatement(requete);
	ps.setString(1,email);
   ResultSet rs = ps.executeQuery();
	String xml="";
	int i=1;
	xml +="<?xml version ='1.0' encoding='ISO-8859-1' standalone='yes' ?>\n";
	/*xml +="<!DOCTYPE publications [\n<!ENTITY e-accent-aigu '&#233;'>\n<!ENTITY c-cedille '&#231;'>]>";*/
	xml +="<utilisateurs>";
        while(rs.next()){
	    xml +="<utilisateur>\n";
	    xml +="<idutilisateur>" + rs.getString("utilisateurb") + "</idutilisateur>\n";
	    xml +="<email>"+ rs.getString("email") +"</email>\n";
	    xml +="<nom>"+ rs.getString("nom") +"</nom>\n";
	    xml +="<prenom>"+ rs.getString("prenom") +"</prenom>\n";
	    xml +="<datenaissance>"+ rs.getString("datenaissance") +"</datenaissance>\n";
	    xml +="<dateamitiees>"+ rs.getString("date") +"</dateamitiees>\n";
	    xml +="</utilisateur>\n";
	    i++;
	}
	xml +="</utilisateurs>";
        out.println(xml);
	c.close();	   
      
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	}
    }
}
