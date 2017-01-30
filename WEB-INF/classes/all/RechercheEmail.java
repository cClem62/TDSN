package all;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import db.Connexion;

@WebServlet("/servlet/rechercheemail")
public class RechercheEmail extends HttpServlet{
    public void service( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	PrintWriter out = res.getWriter();
	req.setCharacterEncoding("ISO-8859-1");
	Connexion c = null;
	try{
	c = new Connexion();
	c.connect();

	String rch = req.getParameter("rch");
	rch +="%";
	String req1 ="select * from utilisateurs where email LIKE ? ;";	
	Connection cc = c.getConnection();
	PreparedStatement ps = cc.prepareStatement(req1);
	ps.setString(1, rch);
	ResultSet rs = ps.executeQuery();

        String xml="";
	xml +="<?xml version ='1.0' encoding='ISO-8859-1' standalone='yes' ?>\n";
	xml +="<utilisateurs>";
        while(rs.next()){
	    xml +="<utilisateur>\n";
	    xml +="<idutilisateur>" +  rs.getString("nom") + " " + rs.getString("prenom")+ "</idutilisateur>\n";
	    xml +="<email>"+ rs.getString("email") +"</email>\n";
	    xml +="<nom>"+ rs.getString("nom") +"</nom>\n";
	    xml +="<prenom>"+ rs.getString("prenom") +"</prenom>\n";
	    xml +="<datenaissance>"+ rs.getString("datenaissance") +"</datenaissance>\n";
	    xml +="</utilisateur>\n";
	}
	if(xml.equals("<?xml version ='1.0' encoding='ISO-8859-1' standalone='yes' ?>\n<utilisateurs>")){
	    out.println("");
	}else{
	xml +="</utilisateurs>";
	out.println(xml);
	}
	c.close();	   
	}catch(Exception e){
	    out.println("<h2>"+e+"</h2>");
	    //out.println("Vous avez déjà aimé");
	}
    }
}
