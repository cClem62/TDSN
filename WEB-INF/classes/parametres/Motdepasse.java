package parametres;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.lang.Object;
import db.Connexion;
import parametres.MD5;

@WebServlet("/servlet/motdepasse")
public class Motdepasse extends HttpServlet{
    public void doPost( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	String mdp = req.getParameter("mdpC");	
	String user = req.getParameter("user");
	
	String mdpH = MD5.encode(mdp);
	
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
	    out.println("");
	}else{
	     out.println("PAS OK");
	}
	/* FIN PARTIE RECUP */    	        
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");	   
	}
    }
}
