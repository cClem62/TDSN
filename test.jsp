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
	      $('#msg').html("<b>Adresse déjà utilisé</b>");
	      }else{
	      $('#msg').html("");
	      }
            });
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
	  }else{
	   out.println("<div class='alert alert-danger' role='alert'>Oups ! Une erreur à eu lieu !</div>");
	  }	
	  }
	  %>

          <div class="jumbotron">
              <h1>Bienvenue sur TDSN ! </h1>
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
	  <input name="mdpC" type="password" id="mdpC" class="form-control" placeholder="Confirmer mot de passe" required><br/>
       
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" name="envoi">Envoyer</button>
    </form>


            </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	  
        </div><!--/.col-xs-12.col-sm-9-->

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
      </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     