<%@ page pageEncoding="ISO-8859-1"%>


<%@include file="template/header.jsp" %>
<input style="display:none;" id="e" value="<%=request.getRemoteUser()%>" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script>
		var disp;	
      function appel() {
      var mail = $("#e").val();     
       $.get('http://localhost:8080/TDSN/servlet/mur?m=' + mail,function(responseText) {
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
         $("#utilisateur").html(user);    	
      	disp +="<div class='col-xs-12 col-lg-8'>" +
	     	"<img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>"+
	    	"<div class='col-xs-9 col-lg-10'>" +
	   	"<h4><b>" + user +"</b> - insociable(e)</h4>" +
		 	"<p>" + txt +"</p>" +
			"<span class='pull-right small'>" + date + "</span>" +
	      "</div>"+
			"</div>";
    		});
    		$("#display").html(disp);
      } 
      $(document).ready(appel());    
    </script> 
  
<div class="row row-offcanvas row-offcanvas-right">

<div class="banner" style="width:851px; height:315px;"></div>

<div class="avatar img-thumbnail"></div>
<span id="utilisateur" style="padding-left:20px;font-size: 3em;"></span>

 <div class="col-xs-6 col-sm-2 sidebar-offcanvas menu-tdsn" id="sidebar">
          <div class="list-group">
            <a href="#" class="list-group-item active">Journal</a>
            <a href="#" class="list-group-item">A propos</a>
            <a href="#" class="list-group-item">Amis</a>
            <a href="#" class="list-group-item">Photos</a>
          </div>
</div><!--/.sidebar-offcanvas-->

	<div class="col-xs-12 col-lg-6">	   
    <form action="servlet/publier" method="post" name="form" id="form" class="form-signin">
        <textarea class="form-control" rows="2" id="publication" name="publication" placeholder="Exprimez-vous"></textarea>
        <input style="display:none" name="user" value="<%=request.getRemoteUser()%>" />
        <input style="display:none" name="source" value="mur.jsp" />
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" name="envoi">Publier</button>    
    </form>  
	 </div>
	
	 <div id="display"></div>
	 

</div><!-- row-offcanvas -->

<%@include file="template/footer.inc" %>
     