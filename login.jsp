<%@ page pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
<%@include file="template/header.jsp" %>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
	
          <div class="jumbotron">	
              <h1>Identifiez vous sur TDSN!</h1>
            <p>Avec TDSN, partagez et restez en contact avec les étudiants de Lille 1.</p>	  	    
          </div>
	  
          <div class="row">

	   <div class="col-xs-12 col-lg-8">

	        <form class="navbar-form navbar-right" action="j_security_check" method="POST">
            <input name="j_username" type="text" class="form-control" placeholder="Adresse email">
	     		<input name="j_password" type="password" class="form-control" placeholder="Mot de passe">
	   	   <input type="submit" class="form-control" value="Connexion" name="envoi">
	   </form>	  

            </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	
        </div><!--/.sidebar-offcanvas-->
	
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     