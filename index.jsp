<%@include file="template/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript">      
     
      function appel() 
      {
           var e = $('#email').val();
             
           $.get('servlet/verifInscription?email='+e,function(responseText)
           {
	      if(responseText.trim() !=""){
	      $('#msg').html("<b style='color:red;'>Veuillez choisir une autre adresse</b>");	
	      $("#btnenvoi").prop("disabled",true);   
	      }else{
	      $("#btnenvoi").prop("disabled",false);
	      $('#msg').html("");
	      }
            });
    }
</script>
<script>
    function verif(){
    var mdp = $('#mdp').val();
    var mdpC = $('#mdpC').val();
    if(mdpC.trim() != ""){
    if(mdp != mdpC){
    	   $('#dispMdp').html("<b style='color:red;'>Les mots de passe sont diff�rents</b>");
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
	
	  <%
	  String param = request.getParameter("ins");
	  if(param != null){
	  if(param.equals("true")){
	  out.println("<div class='alert alert-success' role='alert'>F�licitations ! Vous faites maintenant parti(e) de TDSN ! Connectez vous !</div>");
	  }else if(param.equals("exist")){
		 out.println("<div class='alert alert-warning' role='alert'>Oups ! L'adresse email est d�j� prise !</div>");
	  }else if(param.equals("mdp")){
	  	out.println("<div class='alert alert-warning' role='alert'>Oups ! Les mots de passe sont diff�rents !</div>");
	  }else{
	   out.println("<div class='alert alert-danger' role='alert'>Oups ! Une erreur � eu lieu !</div>");
	  }	
	  }
	  %>       
          <div class="jumbotron">
              <h1>Bienvenue sur TDSN !</h1>
            <p>Avec TDSN, partagez et restez en contact avec les �tudiants de Lille 1.</p>	  	    
          </div>
	  
          <div class="row">

	   <div class="col-xs-12 col-lg-8">

	       <form action="servlet/inscription" method="post" name="form" id="form" class="form-signin">
        <h2 class="form-signin-heading">Inscription</h2><br/>
                <label for="inputEmail" class="sr-only">Nom</label>
        <input name="nom" type="text" id="nom" class="form-control" placeholder="Nom" required autofocus>
       <label for="inputPassword" class="sr-only">Prenom</label>
        <input name="prenom" type="text" id="prenom" class="form-control" placeholder="Prenom" required>
	 <input name="datenaiss" type="date" id="datenaiss" class="form-control" placeholder="1989-04-14" required><br/>
	 <input name="email" type="text" id="email" class="form-control" placeholder="Email" onblur="appel()" required><br/>
	 <span id="msg"></span>
	  <input name="mdp" type="password" id="mdp" class="form-control" placeholder="Mot de passe" required>
	  <input name="mdpC" type="password" id="mdpC" class="form-control" placeholder="Confirmer mot de passe" onkeyup="verif()" required><br/>
       <span id="dispMdp"></span>
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" id="btnenvoi" name="envoi">Envoyer</button>
    </form>


            </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	
        </div><!--/.sidebar-offcanvas-->
	
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     