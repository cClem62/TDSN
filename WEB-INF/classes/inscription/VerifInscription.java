package inscription;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/verifInscription")
public class VerifInscription extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();
	
	String email = req.getParameter("email");
	String verifReq="select * from utilisateurs where email = ?;";
   PreparedStatement ps = c.getConnection().prepareStatement(verifReq);
	ps.setString(1, email);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
	out.println(rs.getString("email"));
	}//else{
	// out.println("Email libre");
	//}  
		c.close();     
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");
	     c.close();
	}
    }
}




