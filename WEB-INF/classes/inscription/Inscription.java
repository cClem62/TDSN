package inscription;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.Date;
import db.Connexion;
import all.Email;

@WebServlet("/servlet/inscription")
public class Inscription extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();
	
	String nom = req.getParameter("nom");
	String prenom = req.getParameter("prenom");
   String datenaiss = req.getParameter("datenaiss");
	String email = req.getParameter("email");
        java.sql.Timestamp  dateinsc = new java.sql.Timestamp(new java.util.Date().getTime());
	String phprof="media/avatar.png";
	String phcouv="media/couverture.jpg";
	String mdp = req.getParameter("mdp");
	String mdpC = req.getParameter("mdpC");
	String verifReq ="select * from utilisateurs where email=?;";
	Connection cc = c.getConnection();
	PreparedStatement pps = cc.prepareStatement(verifReq);
	pps.setString(1, email);
	ResultSet rs = pps.executeQuery();
	String retour = null;
	if(rs.next()){
	    retour = rs.getString("email");
	}else{
	    retour =""; 
	}
	if(retour.trim() == ""){
	if(mdp.equals(mdpC)){

	    // J'ajoute l'utilisateur même dans la base de données 
	   String s = "insert into utilisateurs(email,nom,prenom,datenaissance, dateinscription, photoprofil, photocouverture,mdp) values(?,?,?,?,?,?,?,MD5(?));";
	   PreparedStatement ps = c.getConnection().prepareStatement(s);
	   ps.setString(1,email);
	   ps.setString(2,nom);
	   ps.setString(3, prenom);
	   ps.setDate(4, (java.sql.Date) java.sql.Date.valueOf(datenaiss));
	   java.util.Date today = new java.util.Date();
           ps.setDate(5, new java.sql.Date(today.getTime()));
	   ps.setString(6, phprof);
	   ps.setString(7, phcouv);
	   ps.setString(8,mdp);
	   ps.executeUpdate();

	   // Je lui envoi un mail pour confirmer son inscription
	   String emetteur ="fansdhp62@gmail.com";
	   String sujet ="Inscription TDSN";
	   String contenu ="Bonjour " + prenom + " , nous vous confirmons votre inscription sur TDSN. A bientôt ! ";
	   Boolean b =  Email.send(emetteur, email, sujet, contenu);
		if(b== false){
			out.println("Erreur d'envoi");
		}
	   // J'ajoute son role
	   String rr = "insert into user_roles values(?,'membre');";
	   PreparedStatement ps1 = cc.prepareStatement(rr);
	   ps1.setString(1,email);
	   ps1.executeUpdate();

	   // Je publie un msg comme quoi la personne vient de s'inscrire
	   String msg ="Viens de rejoindre la grande famille TDSN Lille 1, \n souhaitez lui la bienvenue :)";
	   String rNotif ="insert into publications values(DEFAULT,(SELECT MAX(idutilisateur) FROM utilisateurs), ?, ?);";
	   PreparedStatement ps2 = c.getConnection().prepareStatement(rNotif);
	   ps2.setString(1, msg);
	   java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
           ps2.setTimestamp(2, sqlDate);
	   ps2.executeUpdate();

	   // J'insert la position de confidentialité de son mur (par défaut : amis)
	   String rc = "insert into visibilitee values((SELECT MAX(idutilisateur) FROM utilisateurs),'Amis');";
	   PreparedStatement ps3 = cc.prepareStatement(rc);
	   ps3.executeUpdate();

	   
	   c.close();
	   res.sendRedirect("../index.jsp?ins=true");
	}else{
		  c.close();
	     res.sendRedirect("../index.jsp?ins=mdp");
	}
	}else{
	     c.close();
	     res.sendRedirect("../index.jsp?ins=exist");
	}
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	     c.close();
	}
    }
}
