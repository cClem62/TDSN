import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/inscription")
public class Inscription extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("UTF-8");
	Connexion c = null;
	try{
	c = new Connexion("/home/clement/tomcat/webapps/TDSN/tdsn.db");
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
	   String s = "insert into utilisateurs values(NULL,?,?,?,?,?);";
	   PreparedStatement ps = cc.prepareStatement(s);
	   ps.setString(1,nom);
	   ps.setString(2,prenom);
	   ps.setString(3, datenaiss);
	   ps.setString(4, email);
	   ps.setString(5, mdp);
	   ps.executeUpdate();
	   c.close();
	   res.sendRedirect("../index.jsp?ins=true");
	}else{
	     res.sendRedirect("../index.jsp?ins=mdp");
	}
	}else{
	     res.sendRedirect("../index.jsp?ins=exist");
	}
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	}
    }
}
