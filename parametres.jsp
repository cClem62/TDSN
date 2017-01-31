<%@include file="template/header.jsp" %>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
	
          <div class="jumbotron">
              <h1>Vos paramètres</h1><br/>
	        
           <div style="text-align:center; margin:40px 0 40px 0;"> 
           <h2>Apparence</h2>
           <a class="btn btn-primary btn-lg" role="button">Changer d'image</a>  	
           </div>
	      
	      
           <div style="text-align:center; margin:40px 0 40px 0;"> 
           <h2>Mot de passe</h2>
           <a class="btn btn-primary btn-lg" role="button">Modifier mot de passe [DON'T WORK]</a>  	
           </div>
	   
           <div style="text-align:center; margin:80px 0 40px 0;">
           <h2>Confidentialité</h2>
           <a class="btn btn-primary btn-lg" href="confidentialite.jsp" role="button">Changer la confidentialité</a>  
           </div>


          </div>
	  
          <div class="row">

	   <div class="col-xs-12 col-lg-8">

	    


            </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	
        </div><!--/.sidebar-offcanvas-->
	
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     