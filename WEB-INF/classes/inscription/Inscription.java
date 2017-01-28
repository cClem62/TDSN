package inscription;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.Date;
import db.Connexion;

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
	    
	   String s = "insert into utilisateurs(email,nom,prenom,datenaissance,mdp) values(?,?,?,?,?);";
	   PreparedStatement ps = cc.prepareStatement(s);
	   ps.setString(1,email);
	   ps.setString(2,nom);
	   ps.setString(3, prenom);
	   ps.setDate(4, (java.sql.Date) java.sql.Date.valueOf(datenaiss));
	   ps.setString(5, mdp);
	   ps.executeUpdate();


	   String r = "insert into user_roles values(?,'membre');";
	   PreparedStatement ps1 = cc.prepareStatement(r);
	   ps1.setString(1,email);
	   ps1.executeUpdate();

	   String msg ="Viens de rejoindre la grande famille TDSN Lille 1, \n souhaitez lui la bienvenue :)";
	   String rNotif ="insert into publications values(DEFAULT,(SELECT MAX(idutilisateur) FROM utilisateurs), ?, ?);";
	   PreparedStatement ps2 = cc.prepareStatement(rNotif);
	   ps2.setString(1, msg);
	   java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
           ps2.setTimestamp(2, sqlDate);
	   ps2.executeUpdate();
	
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
	}
    }
}
