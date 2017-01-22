<%@ page pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
<%@include file="template/header.inc" %>

<div class="row row-offcanvas row-offcanvas-right">

<div class="banner" style="width:851px; height:315px;"></div>

<div class="avatar img-thumbnail"></div>
<span style="padding-left:20px;font-size: 3em;">Aurélia Catrice</span>

 <div class="col-xs-6 col-sm-2 sidebar-offcanvas menu-tdsn" id="sidebar">
          <div class="list-group">
            <a href="#" class="list-group-item active">Journal</a>
            <a href="#" class="list-group-item">A propos</a>
            <a href="#" class="list-group-item">Amis</a>
            <a href="#" class="list-group-item">Photos</a>
          </div>
</div><!--/.sidebar-offcanvas-->

	<div class="col-xs-12 col-lg-6">	   
    <form action="servlet/inscription" method="post" name="form" id="form" class="form-signin">
        <textarea class="form-control" rows="2" id="publication" name="publication" placeholder="Exprimez-vous"></textarea>
        <button class="btn btn-primary btnPink btn-block" style="margin-top:40px;" type="submit" name="envoi">Publier</button>    
    </form>  
	 </div>
	 
	 <!-- TOUTES LES PUBLICATIONS -->
	 <div class="col-xs-12 col-lg-8">
	     <img src="avatar.jpg" style="width:60px;float:left;" class="img-responsive img-thumbnail" alt="Cinque Terre"> 
	    <div class="col-xs-9 col-lg-10">
	     	 <h4><b>Aurélia Catrice</b> - insociable(e)</h4>
		 	<p>Je m'enferme dans ma chambre, et je n'en sors plus avant lundi !!!</p>
			<span class="pull-right small">Publié il y a 1 jours</span>
	    </div>
	</div>	 

	 <div class="col-xs-12 col-lg-8">
	     <img src="avatar.jpg" style="width:60px;float:left;" class="img-responsive img-thumbnail" alt="Cinque Terre"> 
	    <div class="col-xs-9 col-lg-10">
	     	 <h4><b>Aurélia Catrice</b> - triste(e)</h4>
		 	<p>Je vais enmener mon chat au véto, il a la gastro :(</p>
			<span class="pull-right small">Publié il y a 1 jours</span>
	    </div>
	</div>
		 
	 
	 <div class="col-xs-12 col-lg-8">
	     <img src="avatar.jpg" style="width:60px;float:left;" class="img-responsive img-thumbnail" alt="Cinque Terre"> 
	    <div class="col-xs-9 col-lg-10">
	     	 <h4><b>Aurélia Catrice</b> - énervé(e)</h4>
		 	<p>J'AI DIT PAS LES MAMANS !!! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget massa metus. Nulla eget magna maximus, consectetur libero nec, pretium nulla. Sed blandit leo vel est dictum iaculis. Nulla facilisi. Curabitur nibh turpis, vestibulum sed tortor ac, iaculis varius ligula. Praesent convallis dui ut suscipit mattis. Phasellus nec neque gravida, molestie lacus at, cursus nulla.
			</p>
			<span class="pull-right small">Publié il y a 3 jours</span>
	    </div>
	</div>
	
	 <div class="col-xs-12 col-lg-8">
	     <img src="avatar.jpg" style="width:60px;float:left;" class="img-responsive img-thumbnail" alt="Cinque Terre"> 
	    <div class="col-xs-9 col-lg-10">
	     	 <h4><b>Aurélia Catrice</b> - heureuse(e)</h4>
		 	<p>J'ai réussi à monter sur mon cheval, enfin dressé celui là ! Grrrr</p>
			<span class="pull-right small">Publié il y a 4 jours</span>
	    </div>
	</div>
	 <!-- TOUTES LES PUBLICATIONS -->

</div><!-- row-offcanvas -->

<%@include file="template/footer.inc" %>
     