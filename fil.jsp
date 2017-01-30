<%@include file="template/header.jsp" %>
<%@ page pageEncoding="ISO-8859-1"%>
<input style="display:none;" id="e" value="<%=request.getRemoteUser()%>" />
<script src="js/jquery-3.1.1.min.js"></script>

<script type="text/javascript" >	
      var user = $("#e").val();
      alert(idpub);	
      alert(user);
      function appel(idpub) {
      var mail = $("#e").val();     
       $.get('servlet/aimer?user=' + user + '&id=' + idpub ,function(responseText) {
       $("#jaime" + idpub).html(responseText);
      })
        .fail(function( data ) {
    alert( "Echec" );
      });	
      }
             
 </script>

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
	   <div style="margin-top:20%;">
	   <%@ page import="java.sql.*, java.io.*, java.net.*" %>
	   <%@ page import="db.Connexion" %>
    	<%
	 	try{
	 	   Connexion c = new Connexion();
			c.connect();
			String user = request.getRemoteUser();  
			String requete="";
			requete +="SELECT p.idpublication, p.utilisateur, contenu, date, u.nom, u.prenom, count(publi_id) as nbjaime FROM publications as p INNER JOIN utilisateurs u ON p.utilisateur = idUtilisateur LEFT JOIN jaime as j ON idpublication = publi_id WHERE p.utilisateur IN(SELECT utilisateurB FROM amitiees WHERE utilisateurA=(SELECT idUtilisateur FROM utilisateurs as z WHERE email='" + user + "' GROUP BY idutilisateur) GROUP BY utilisateurb) OR p.utilisateur=(SELECT idUtilisateur FROM utilisateurs WHERE email='" + user + "') GROUP BY p.idpublication, p.utilisateur, contenu, date, u.nom, u.prenom ORDER BY date DESC;"; 
			Connection cc = c.getConnection();
			PreparedStatement ps = cc.prepareStatement(requete);
			ResultSet rs = ps.executeQuery();
			String disp;
		   c.close();	
			while(rs.next()){			
			String idp = rs.getString("idpublication");
			%>
				<div class='col-xs-12 col-lg-8'>
				<div id="<%= idp %>" style="display:none;"><%= idp %></div>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><a href='mur-vue.jsp?id=<%= rs.getString("utilisateur") %>' style=""><b><%= rs.getString("nom") + " " + rs.getString("prenom") %></b></a></h4>
		 	   <p><%= rs.getString("contenu")%></p>
		 	   <p id="jaime<%=idp%>" class="small"><%= rs.getString("nbjaime") %> j'aime <span><a onclick="appel(<%=idp%>)" style="margin-left:6px;">J'aime </a><a href="" style="margin-left:6px;"> Je n'aime pas</a></span></p>	 	 
		 	   <span class='pull-right small'><%= rs.getString("date")%></span>
	         </div>
			   </div>
			   <%
			   }			
	 	}catch(Exception e){
	     out.println("<h2>"+e+"</h2>");		
			}				
	%>
    </div>
	</div><!-- row -->
	 	  
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
           <!--  <a href="/TDSN/fil.jsp" class="list-group-item active">Le fil d'actualitÃ©</a> -->
            <a href="/TDSN/mur.jsp" class="list-group-item active">Mon mur</a>       
            <a href="/TDSN/parametres.jsp" class="list-group-item">Param�tres</a>   
          </div>
        </div><!--/.sidebar-offcanvas-->
       	        
     </div><!--/row-->
      <hr>
      
  <%@include file="template/footer.inc" %>
     