<%@ page pageEncoding="ISO-8859-1"%>

<%@include file="template/header.jsp" %>
<input style="display:none;" id="e" value="<%=request.getRemoteUser()%>" />
<script src="js/jquery-3.1.1.min.js"></script>
<script>
	var user = $("#e").val();
      function appel(idpub) {
      var user = $("#e").val();    
       $.get('servlet/aimer?user=' + user + '&id=' + idpub ,function(responseText) {
       donnejaime(idpub);
      })
        .fail(function( data ) {
    alert( "Echec" );
      });	
      }
      
      function donnejaime(id) {
       $.get('servlet/donnerjaime?idpub=' + id,function(responseText) {
        $("#jaime" + id).html(responseText);
      })
        .fail(function( data ) {
    alert( "Echec" );
      });	
      }
             
  function charge_amis(){  
       var mail = $("#iduser").text();
       $.get('servlet/amitiees?m=' + mail,function(responseText) {
      	parseXml_amis(responseText);
     	 })
        .fail(function( data ) {
    		 	alert( "Echéc" );
      });
      }
      
      function parseXml_amis(xml){		
			$xml = $( $.parseXML( xml ) );
			var disp="";
         $xml.find("utilisateur").each(function(){
      	var user = $(this).find("idutilisateur").text();   
      	var mail = $(this).find("email").text();  
      	var nom = $(this).find("nom").text();   
      	var prenom = $(this).find("prenom").text();    
      	var datenaiss = $(this).find("datenaissance").text();
      	var datea = $(this).find("dateamitiees").text();                      	
      	disp +="<div class='col-xs-12 col-lg-8'>" +
	     	"<img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>"+
	    	"<div class='col-xs-9 col-lg-10'>" +
	   	"<h4><b>" + nom + " " + prenom +"</b></h4>" +
		 	"<p>" + mail + "</p>" +
			"<span class='pull-right small'>Amis depuis le " + datea + "</span>" +
	      "</div>"+
			"</div>";
    		});
    		$("#display").html(disp);
      } 
</script>

<div class="row row-offcanvas row-offcanvas-right">

<%@ page import="java.sql.*, java.io.*, java.net.*" %>
	   <%@ page import="db.Connexion" %>
    	<%
	 	try{
	      Connexion c = new Connexion();
			c.connect();
			int id = Integer.parseInt(request.getParameter("id"));
			String req4="SELECT * FROM utilisateurs WHERE idutilisateur=?;";
			Connection cc = c.getConnection();
			PreparedStatement ps4 = cc.prepareStatement(req4);
			ps4.setInt(1,id);
			ResultSet rs4 = ps4.executeQuery();
		
			while(rs4.next()){ %>
<div class="banner" style="width:851px; height:315px; background-image:url( <%= rs4.getString("photocouverture") %> );"></div>
<div style="background-image:url( <%= rs4.getString("photoprofil") %> );" class="avatar img-thumbnail"></div>
<span id="iduser" style="display: none;"><%= rs4.getString("email") %></span>
<span id="utilisateur" style="padding-left:20px;font-size: 3em;"><%= rs4.getString("nom") + " " + rs4.getString("prenom") %></span>
 <div class="col-xs-6 col-sm-2 sidebar-offcanvas menu-tdsn" id="sidebar">
          <div class="list-group">
            <a onclick="window.location.reload()" class="list-group-item active">Journal</a>
            <a href="#" class="list-group-item">A propos</a>
            <a onclick="charge_amis()" class="list-group-item">Amis</a>
            <a href="#" class="list-group-item">Photos</a>
          </div>
</div><!--/.sidebar-offcanvas-->

<div class="col-xs-12 col-lg-6">	   
  <div style="margin-top:5%;" class="btn-group btn-group-justified" role="group" aria-label="...">
  <div class="btn-group" role="group">
    <button id="ajout" onclick="ajouter()" type="button" class="btn btn-default">Ajouter</button>
  </div>
  </div>
  </div>
<% }
c.close();
}catch(Exception e){
	out.println("<h1>" + e + "</h2>");
} %>
	
	
	 
    	<%
	 	try{
	 	   Connexion c = new Connexion();
			c.connect();
			int id = Integer.parseInt(request.getParameter("id"));
		   String email = request.getRemoteUser();
			String req2="SELECT * FROM visibilitee WHERE utilisateur=?;";
			Connection cc = c.getConnection();
			PreparedStatement ps1 = cc.prepareStatement(req2);
			ps1.setInt(1,id);
			ResultSet rs1 = ps1.executeQuery();
			String etat="";
			if(rs1.next()){
				etat = rs1.getString("libelle");			
			}
			//out.println("<h2>" + etat + "</h2>");
		if(etat.equals("Privée")){ %>
		out.println("<h1>Ce mur est privé</h1>");		
		<%
		}else{
	
		}			
			
			if(!etat.equals("Privée")){
				if(etat.equals("Amis")){
					String req3="SELECT * FROM amitiees WHERE utilisateurA=? AND utilisateurB=(SELECT idutilisateur FROM utilisateurs WHERE email=?);";
					PreparedStatement ps2 = cc.prepareStatement(req3);
					ps2.setInt(1,id);
					ps2.setString(2,email);
					ResultSet rs2 = ps2.executeQuery();
					String amis="";
					if(rs2.next()){
						amis = rs2.getString("utilisateurb");							
					}				
				   if(amis.trim() ==""){ 
		       id=0;
				   }
				}
			
			String req1 ="SELECT p.idpublication, p.utilisateur, contenu, date, u.nom, u.prenom, u.email, count(publi_id) as nbjaime FROM publications as p INNER JOIN utilisateurs u ON p.utilisateur = idUtilisateur LEFT JOIN jaime as j ON idpublication = publi_id WHERE p.utilisateur=? GROUP BY p.idpublication, p.utilisateur, p.contenu, p.date, u.prenom, u.nom, u.email;";	
			PreparedStatement ps = cc.prepareStatement(req1);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			int i=0;
         while(rs.next()){
         String idp= rs.getString("idpublication");
			%>             
				<div class='col-xs-12 col-lg-8'>		
				<% if(i ==0){ %>
				<div id="iduser" style="display:none;"><%= rs.getString("email") %></div>
				<% } i =1; %>					
				<div id="<%= idp %>" style="display:none;"><%= idp %></div>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4 id="user"><b><%= rs.getString("nom") + " " + rs.getString("prenom") %></b></h4>
		 	   <p><%= rs.getString("contenu")%></p>
		 	   <p id="jaime<%=idp%>" class="small"><%= rs.getString("nbjaime") %> j'aime <span><a onclick="appel(<%=idp%>)" style="margin-left:6px;">J'aime </a></span></p>
		 	  <p id="msg"></p>
		 	   <span class='pull-right small'><%= rs.getString("date")%></span>
	         </div>
			   </div>
			  <% }
			  c.close();
			  }else{	
							c.close();  
			  }
			  }catch(Exception e){
			  		out.println("<h2>" + e + "</h2>");
			  } %>			  	
</div><!-- row-offcanvas -->
 <script>				
 		

	 function ajouter(){
       var mail = $("#e").val();    	
       alert(mail); 
       var id = $("#iduser").text();
       $.get('servlet/ajout?m=' + mail + '&id=' + id ,function(responseText) {
       $("#ajout").html(responseText);
      })
        .fail(function( data ) {
    alert( "Echéc" );
      });	
      }
             			
			

</script> 
<%@include file="template/footer.inc" %>
     