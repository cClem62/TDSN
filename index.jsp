 <%@ page pageEncoding="UTF-8"%>
<%@include file="template/header.inc" %>
<div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron">
            <h1>Bienvenue sur TDSN ! </h1>
            <p>Avec TDSN, partagez et restez en contact avec les étudiants de Lille 1.</p>
          </div>
	  
          <div class="row">
            <div class="col-xs-12 col-lg-8">

	       <form action="" method="post" name="form" id="form" class="form-signin">
        <h2 class="form-signin-heading">Inscription</h2><br/>
                <label for="inputEmail" class="sr-only">Nom</label>
        <input name="nom" type="text" id="nom" class="form-control" placeholder="Nom" required autofocus>
       <label for="inputPassword" class="sr-only">Prenom</label>
        <input name="prenom" type="text" id="prenom" class="form-control" placeholder="Prenom" required>
	 <input name="datenaiss" type="date" id="datenaiss" class="form-control" placeholder="1989-04-14" required><br/>
	 <input name="email" type="text" id="email" class="form-control" placeholder="Email" required><br/>

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