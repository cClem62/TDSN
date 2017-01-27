package all;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/publier")
public class Aimer extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("iso-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	/* PARTIE RECUPERAION ID PAR RAPPORT AU EMAIL */
	String m = req.getParameter("user");
        int idpub = (int)req.getParameter("id");
	String requete ="insert into jaime values(DEFAULT, ?,?);";
	Connection cc = c.getConnection();
	PreparedStatement ps = cc.prepareStatement(requete);
	ps.setString(1, m);
	ps.setInt(2, idpub);
	ResultSet rs = ps.executeQuery();
	
	c.close();	   
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	}
    }
}
