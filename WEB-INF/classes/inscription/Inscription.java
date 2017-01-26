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
