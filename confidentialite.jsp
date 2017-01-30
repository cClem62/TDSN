<%@include file="template/header.jsp" %>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
	
          <div class="jumbotron">
              <h1>Confidentialité de votre mur</h1><br/>
                   
           <div style="margin:40px 0 40px 0;"> 
           <span>Etat actuel : Amis</span>
           <h3>Modifier l'état</h3>
           
           <a class=btn btn-primary dropdown-toggle data-toggle=dropdown href=#>Sélectionnez une option :<span class=caret></span></a>
<ul class=dropdown-menu>
<li><a href=#>Choix n°1</a></li>
<li><a href=#>Choix n°2</a></li>
<li><a href=#>Choix n°3</a></li>
</ul> 

           </div>
              
           <div style="margin:40px 0 40px 0;"> 
           <h2 style="text-align:center;">Que choisir ?</h2>     	
           </div>
           <ul class="list-group">
 				 <li class="list-group-item">Public <span style="padding-left:40%;">Tout le monde peut voir votre mur</span></li>
 				 <li class="list-group-item">Amis <span style="padding-left:40%;">Seul(e)s vos amis peuvent voir votre mur</span></li>
 				 <li class="list-group-item">Privé <span style="padding-left:40%;">Seul vous même voyez votre mur</span></li>
 			
			 </ul>
          
          </div>
	  
          <div class="row">

	   <div class="col-xs-12 col-lg-8">

	    


            </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	
        </div><!--/.sidebar-offcanvas-->
	
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     