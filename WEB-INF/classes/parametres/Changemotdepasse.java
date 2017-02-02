package parametres;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.lang.Object;
import db.Connexion;
import parametres.MD5;

@WebServlet("/servlet/changemdp")
public class Changemotdepasse extends HttpServlet{
    public void doPost( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	String mdpC = req.getParameter("mdpC");
	String mdp = req.getParameter("mdp");
	String mdpA = req.getParameter("mdpA");
	String user = req.getParameter("user");
	
	String mdpH = MD5.encode(mdpA);
	
	String req1 ="select mdp from utilisateurs where email=?";
	Connection cc = c.getConnection();
        PreparedStatement ps1 = cc.prepareStatement(req1);
	ps1.setString(1, user);
	ResultSet rs = ps1.executeQuery();
	String mdpB="";
	if(rs.next()){
		mdpB = rs.getString("mdp");
	}
	if(mdpH.equals(mdpB)){
	        mdpC = MD5.encode(mdpC);
	    	String req2 ="UPDATE utilisateurs set mdp=? WHERE email=?";
		PreparedStatement ps = cc.prepareStatement(req2);
		ps.setString(1, mdpC);
		ps.setString(2, user);
		ps.executeUpdate();
	        out.println("MOT DE PASSE CHANGEE");
	}else{
	     out.println("PAS OK");
	}
	/* FIN PARTIE RECUP */    	        
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");	   
	}
    }
}
