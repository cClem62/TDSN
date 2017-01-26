<%@ page pageEncoding="ISO-8859-1"%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 
<%@include file="template/header.jsp" %>

<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
	
	   <div class="row">
	   	<div class="col-xs-12 col-lg-8">	   
    <form action="servlet/publier" method="post" name="form" id="form" class="form-signin">
        <textarea class="form-control" rows="2" id="publication" name="publication" placeholder="Exprimez-vous"></textarea>
        <input style="display:none" name="user" value="<%=request.getRemoteUser()%>" />
        <input style="display:none" name="source" value="fil.jsp" />
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" name="envoi">Publier</button>    
    </form>
	   
	   </div>
	   <%@ page import="java.sql.*, java.io.*, java.net.*" %>
	   <%@ page import="db.Connexion" %>
	<%
	 	try{
	 	   Connexion c = new Connexion();
			c.connect();
			String user = request.getRemoteUser();  
			String requete="";
			requete +="SELECT * FROM publications INNER JOIN utilisateurs ON utilisateur = idUtilisateur WHERE utilisateur IN(SELECT utilisateurB FROM amitiees WHERE utilisateurA=(SELECT idUtilisateur FROM utilisateurs WHERE email='" + user + "') OR utilisateur=(utilisateurs.idutilisateur) ORDER BY date DESC);"; 
			Connection cc = c.getConnection();
			PreparedStatement ps = cc.prepareStatement(requete);
			ResultSet rs = ps.executeQuery();
			String disp;
			
			while(rs.next()){
			%>
				<div class='col-xs-12 col-lg-8'>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><b><%= rs.getString("nom") + " " + rs.getString("prenom") %></b> - insociable(e)</h4>
		 	   <p><%= rs.getString("contenu")%></p>
		 	   <span class='pull-right small'><%= rs.getString("date")%></span>
	         </div>
			   </div>
			   <%
			   }
			c.close();			
	 	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");		
			}				
	%>
	</div><!-- row -->
	 	  
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
           <!--  <a href="/TDSN/fil.jsp" class="list-group-item active">Le fil d'actualité</a> -->
            <a href="/TDSN/mur.jsp" class="list-group-item active">Mon mur</a>           
          </div>
        </div><!--/.sidebar-offcanvas-->
     </div><!--/row-->
      <hr>
      
  <%@include file="template/footer.inc" %>
     