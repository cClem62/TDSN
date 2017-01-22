<%@ page pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript">      
     $(document).ready(appel());
      function appel() 
      {
          var e = $('#email').val();
	  
           $.get('http://localhost:8080/TDSN/servlet/verifInscription?email='+e,function(responseText)
           {
	      if(responseText.trim() !=""){
	      $('#msg').html("<b style='color:red;'>Adresse déjà utilisé</b>");
	      }else{
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
    	   $('#dispMdp').html("<b style='color:red;'>Les mots de passe sont différents</b>");
    }else{
	  $('#dispMdp').html("");
    }
    }else{
	 $('#dispMdp').html("");
    }
    }
  </script>

<%@include file="template/header.inc" %>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>

	  <%
	  String param = request.getParameter("ins");
	  if(param != null){
	  if(param.equals("true")){
	  out.println("<div class='alert alert-success' role='alert'>Félicitations ! Vous faites maintenant parti(e) de TDSN ! Connectez vous !</div>");
	  }else if(param.equals("exist")){
		 out.println("<div class='alert alert-warning' role='alert'>Oups ! L'adresse email est déjà prise !</div>");
	  }else if(param.equals("mdp")){
	  	out.println("<div class='alert alert-warning' role='alert'>Oups ! Les mots de passe sont différents !</div>");
	  }else{
	   out.println("<div class='alert alert-danger' role='alert'>Oups ! Une erreur à eu lieu !</div>");
	  }	
	  }
	  %>
          <% int a = 1;
	       if(a == 1){
	       %>
          <div class="jumbotron">
              <h1>Bienvenue sur TDSN !</h1>
            <p>Avec TDSN, partagez et restez en contact avec les étudiants de Lille 1.</p>	  	    
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
	 <input name="email" type="text" id="email" class="form-control" placeholder="Email" onkeyup="appel()" required><br/>
	 <panel id="msg"></panel>
	  <input name="mdp" type="password" id="mdp" class="form-control" placeholder="Mot de passe" required>
	  <input name="mdpC" type="password" id="mdpC" class="form-control" placeholder="Confirmer mot de passe" onkeyup="verif()" required><br/>
       <span id="dispMdp"></span>
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" name="envoi">Envoyer</button>
    </form>


            </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	  <% }else{ %>
	   <div class="row">
	   	<div class="col-xs-12 col-lg-8">	   
    <form action="servlet/inscription" method="post" name="form" id="form" class="form-signin">
        <textarea class="form-control" rows="2" id="publication" name="publication" placeholder="Exprimez-vous"></textarea>
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" name="envoi">Publier</button>    
    </form>
	   
	   </div>
	   
	 <div class="col-xs-12 col-lg-8">
	     <img src="avatar.jpg" style="width:60px;float:left;" class="img-responsive img-thumbnail" alt="Cinque Terre"> 
	    <div class="col-xs-12 col-lg-10">
	     	 <h4><b>Aurélia Catrice</b> - énervé(e)</h4>
		 	<p>J'AI DIT PAS LES MAMANS !!! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget massa metus. Nulla eget magna maximus, consectetur libero nec, pretium nulla. Sed blandit leo vel est dictum iaculis. Nulla facilisi. Curabitur nibh turpis, vestibulum sed tortor ac, iaculis varius ligula. Praesent convallis dui ut suscipit mattis. Phasellus nec neque gravida, molestie lacus at, cursus nulla.
			</p>
			<span class="pull-right small">Publié il y a 34 secondes</span>
	    </div>
	</div>

	 <div class="col-xs-12 col-lg-8">
	     <img src="avatar.jpg" style="width:60px;float:left;" class="img-responsive img-thumbnail" alt="Cinque Terre"> 
	    <div class="col-xs-12 col-lg-10">
	     	 <h4><b>Aurélia Catrice</b> - énervé(e)</h4>
		 	<p>J'AI DIT PAS LES MAMANS !!! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget massa metus. Nulla eget magna maximus, consectetur libero nec, pretium nulla. Sed blandit leo vel est dictum iaculis. Nulla facilisi. Curabitur nibh turpis, vestibulum sed tortor ac, iaculis varius ligula. Praesent convallis dui ut suscipit mattis. Phasellus nec neque gravida, molestie lacus at, cursus nulla.
			</p>
			<span class="pull-right small">Publié il y a 34 secondes</span>
	    </div>
	</div>

 <div class="col-xs-12 col-lg-8">
	     <img src="avatar.jpg" style="width:60px;float:left;" class="img-responsive img-thumbnail" alt="Cinque Terre"> 
	    <div class="col-xs-12 col-lg-10">
	     	 <h4><b>Aurélia Catrice</b> - énervé(e)</h4>
		 	<p>J'AI DIT PAS LES MAMANS !!! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget massa metus. Nulla eget magna maximus, consectetur libero nec, pretium nulla. Sed blandit leo vel est dictum iaculis. Nulla facilisi. Curabitur nibh turpis, vestibulum sed tortor ac, iaculis varius ligula. Praesent convallis dui ut suscipit mattis. Phasellus nec neque gravida, molestie lacus at, cursus nulla.
			</p>
			<span class="pull-right small">Publié il y a 34 secondes</span>
	    </div>
	</div>


	     </div><!-- row -->
	   <%
	  }
	  %>
	  
        </div><!--/.col-xs-12.col-sm-9-->
 <%  if(a == 0){ %>
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="#" class="list-group-item active">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
            <a href="#" class="list-group-item">Link</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
	<% } %>
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     