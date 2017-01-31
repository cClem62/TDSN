package all;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import org.apache.commons.lang.StringEscapeUtils;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/publier")
public class Publier extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	/* PARTIE RECUPERAION ID PAR RAPPORT AU EMAIL */
	String m = req.getParameter("user"); 
	String requete1 ="select idutilisateur from utilisateurs where email=?";
	Connection cc = c.getConnection();
	PreparedStatement ps1 = cc.prepareStatement(requete1);
	ps1.setString(1, m);
	ResultSet rs = ps1.executeQuery();
	int iduser =0;
	if(rs.next()){
		iduser = rs.getInt("idUtilisateur");
	}
	/* FIN PARTIE RECUP */    

	    
	    
	/* PARTIE INSERTION DE LA PUBLICATION */

        String source = req.getParameter("source");
	String texte = req.getParameter("publication");
	//texte = StringEscapeUtils.escapeHtml(texte);
	String date="2017-04-02";

	String requete ="insert into publications values(DEFAULT,?,?,?);";
	PreparedStatement ps = cc.prepareStatement(requete);
	
	ps.setInt(1,iduser);
	ps.setString(2, texte);
        java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
        ps.setTimestamp(3, sqlDate);
        ps.executeUpdate();
        c.close();
        res.sendRedirect("../" + source);  
       
	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");	   
	}
    }
}
