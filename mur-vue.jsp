<%@ page pageEncoding="ISO-8859-1"%>


<%@include file="template/header.jsp" %>
<input style="display:none;" id="e" value="<%=request.getRemoteUser()%>" />

<script src="js/jquery-3.1.1.min.js"></script>

<div class="row row-offcanvas row-offcanvas-right">

<div class="banner" style="width:851px; height:315px;"></div>

<div class="avatar img-thumbnail"></div>
<span id="utilisateur" style="padding-left:20px;font-size: 3em;"></span>
 <div class="col-xs-6 col-sm-2 sidebar-offcanvas menu-tdsn" id="sidebar">
          <div class="list-group">
            <a onclick="appel()" class="list-group-item active">Journal</a>
            <a href="#" class="list-group-item">A propos</a>
            <a onclick="charge_amis()" class="list-group-item">Amis</a>
            <a href="#" class="list-group-item">Photos</a>
          </div>
</div><!--/.sidebar-offcanvas-->

	<div class="col-xs-12 col-lg-6">	   
  
  <div style="margin-top:5%;" class="btn-group btn-group-justified" role="group" aria-label="...">
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Ajouter</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Retirer</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Bloquer</button>
  </div>
</div>
   
	</div>
	
	 <div style="margin-top:15%;" id="display">

	   <%@ page import="java.sql.*, java.io.*, java.net.*" %>
	   <%@ page import="db.Connexion" %>
    	<%
	 	try{
	      Connexion c = new Connexion();
			c.connect();
			int id = Integer.parseInt(request.getParameter("id"));
			String req1 ="SELECT p.idpublication, p.utilisateur, p.contenu, p.date, u.prenom, u.nom, count(publi_id) as nbjaime FROM publications as p INNER JOIN jaime as j ON p.idpublication = j.publi_id INNER JOIN utilisateurs as u ON j.utilisateur = u.idutilisateur WHERE p.utilisateur=? GROUP BY p.idpublication, p.utilisateur, p.contenu, p.date, u.prenom, u.nom;";	
			Connection cc = c.getConnection();
			PreparedStatement ps = cc.prepareStatement(req1);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
         while(rs.next()){
         String idp= rs.getString("idpublication");
			%>             
				<div class='col-xs-12 col-lg-8'>
				<div id="user" style="display:none;"><%= rs.getString("nom") + " " + rs.getString("prenom") %></div>
				<div id="<%= idp %>" style="display:none;"><%= idp %></div>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><b><%= rs.getString("nom") + " " + rs.getString("prenom") %></b></h4>
		 	   <p><%= rs.getString("contenu")%></p>
		 	   <p class="small"><%= rs.getString("nbjaime") %> j'aime <span><a onclick="appel(<%=idp%>)" style="margin-left:6px;">J'aime </a><a href="" style="margin-left:6px;"> Je n'aime pas</a></span></p>
		 	  <p id="msg"></p>
		 	   <span class='pull-right small'><%= rs.getString("date")%></span>
	         </div>
			   </div>
			  <% }
			  }catch(Exception e){
			  		out.println("<h2>" + e + "</h2>");
			  } %>			  
	 
	 </div>
	 

</div><!-- row-offcanvas -->
 <script>				
 			var user = $("#user").text();
         $("#utilisateur").html(user);   
</script> 
<%@include file="template/footer.inc" %>
     