<%@ page pageEncoding="ISO-8859-1"%>


<%@include file="template/header.jsp" %>
<input style="display:none;" id="e" value="<%=request.getRemoteUser()%>" />

<script src="js/jquery-3.1.1.min.js"></script>

<script>
		var disp;	
      function appel() {
      var mail = $("#e").val();     
       $.get('servlet/mur?m=' + mail,function(responseText) {
      parseXml(responseText);
      })
        .fail(function( data ) {
    alert( "Echéc" );
      });	
      }
         
      function parseXml(xml){		
			$xml = $( $.parseXML( xml ) );
			var disp="";
         $xml.find("publication").each(function(){
      	var user = $(this).find("utilisateur").text();   
      	var txt = $(this).find("contenu").text();  
      	var date = $(this).find("date").text();     
      	var jaime = $(this).find("jaime").text();    
			var idp = $(this).find("idpublication").text(); 
			var profil = $(this).find("photoprofil").text(); 
         $("#utilisateur").html(user);    	
      	disp +="<div class='col-xs-12 col-lg-8'>" +
	     	"<img src="+ profil +" style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>"+
	    	"<div class='col-xs-9 col-lg-10'>" +
	   	"<h4><b>" + user +"</b></h4>" +
		 	"<p>" + txt +"</p>" +
         "<p class='small'>" + jaime + " j'aime <span><a onclick='appel(" + idp +")' style='margin-left:6px;'>J'aime </a></span></p>"+
			"<span class='pull-right small'>" + date + "</span>" +
	      "</div>"+
			"</div>";
    		});
    		$("#display").html(disp);
      } 
      $(document).ready(appel());    
      
      function charge_amis(){
		 var mail = $("#e").val();     
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
      	var profil = $(this).find("photoprofil").text();                      	
      	disp +="<div class='col-xs-12 col-lg-8'>" +
	     	"<img src="+ profil +" style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>"+
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
			String user = request.getRemoteUser();
			String req4="SELECT * FROM utilisateurs WHERE email=?;";
			Connection cc = c.getConnection();
			PreparedStatement ps4 = cc.prepareStatement(req4);
			ps4.setString(1,user);
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

<% }
c.close();
}catch(Exception e){
	out.println("<h1>" + e + "</h2>");
} %>
	<div class="col-xs-12 col-lg-6">	   
    <form action="servlet/publier" method="post" name="form" id="form" class="form-signin">
        <textarea class="form-control" rows="2" id="publication" name="publication" placeholder="Exprimez-vous"></textarea>
        <input style="display:none" name="user" value="<%=request.getRemoteUser()%>" />
        <input style="display:none" name="source" value="mur.jsp" />
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" name="envoi">Publier</button>    
    </form>  
	 </div>
	
	 <div style="margin-top:15%;" id="display"></div>
	 

</div><!-- row-offcanvas -->

<%@include file="template/footer.inc" %>
     