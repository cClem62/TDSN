<%@include file="template/header.jsp" %>
<input style="display:none;" id="e" value="<%=request.getRemoteUser()%>" />
<script>
function appel() {
	 var mdp = $("#mdpA").val();
	 var user = $("#e").val();
	 var http = new XMLHttpRequest();
	 var url = "/TDSN/servlet/motdepasse";
	 var params = "mdpC=" + mdp  + "&user=" + user;
	 http.open("POST", url, true);
	 http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	 http.onreadystatechange = function() {//Call a function when the state changes.
   		 if(http.readyState == 4 && http.status == 200) {
		 		    if(http.responseText !=""){
				     $("#msgMdp").html("Mot de passe valide");
				    }
				  }
	 }
http.send(params);
      }
      
      function verif_mdp(){
    var mdp = $('#mdp').val();
    var mdpC = $('#mdpC').val();
    if(mdpC.trim() != ""){
    if(mdp != mdpC){
    	   $('#dispMdp').html("<b style='color:red;'>Les mots de passe sont différents</b>");
    	   $("#btnenvoi").prop("disabled",true);   
    }else{
	  $('#dispMdp').html("");
	    $("#btnenvoi").prop("disabled",false);   
    }
    }else{
	 $('#dispMdp').html("");
	   $("#btnenvoi").prop("disabled",false);   
    }
    }
      </script>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
	
          <div class="jumbotron">
              <h1>Mot de passe</h1><br/>
	        
             <form action="servlet/changemdp" method="post" name="form" id="form" class="form-signin">
        <h2 class="form-signin-heading">Modification</h2><br/>
                <label for="inputEmail" class="sr-only">Nom</label>
        <input name="mdpA" type="password" id="mdpA" class="form-control" onblur="appel()" placeholder="Mot de passe actuel" required autofocus>
	<span id="msgMdp"></span>
        <input name="mdp" type="password" id="prenom" class="form-control" placeholder="Nouveau mot de passe" required>
	 <input name="mdpC" type="password" id="datenaiss" onblur="verif_mdp()" class="form-control" placeholder="Confirmer mot de passe" required><br/>
       <span id="dispMdp"></span>
       <input style="display:none;" name="user" value="<%=request.getRemoteUser()%>" />
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" id="btnenvoi" name="envoi">Envoyer</button>
    </form>

          </div>
	  
          <div class="row">

	   <div class="col-xs-12 col-lg-8">

	    


            </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	
        </div><!--/.sidebar-offcanvas-->
	
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     