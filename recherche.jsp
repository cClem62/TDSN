<%@ page pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 
<%@include file="template/header.jsp" %>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
	
          <div class="jumbotron">
              <h1>Recherche d'utilisateurs</h1>
            <h2>TDSN de Lille 1</h2>
            <h3>Vous êtes plus nombreux que vous ne le pensez</h3>	  	    
          </div>
	  
          <div class="row">

	   <div class="col-xs-12 col-lg-12">
 
     <form method="post" name="form" id="form" class="navbar-form form-signin">
          
            <input type="text" class="form-control" placeholder="Email">
            <button type="submit" class="btn btn-primary btn-md">OK</button>
            <span style="margin:0 25px 0 25px;" class="big">OU</span>
             <input type="text" class="form-control" placeholder="Prenom Nom">
            <button type="submit" class="btn btn-primary btn-md">OK</button>
            
     </form>	
   
          
           
            
    
  
          <div name="display">

				<div class='col-xs-12 col-lg-6'>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><b>Aurélia Catrice</b></h4>
		 	   <p>aurelia.catrice@univ-lille1.fr</p> 	  
		 	   <span class='pull-right small'>Membre depuis le..</span>
	         </div>
			   </div>  
			  
			  
			    
			   <div class='col-xs-12 col-lg-6'>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><b>Clément Cantraine</b></h4>
		 	   <p>clement.cantraine@univ-lille1.fr</p>		 	  
		 	   <span class='pull-right small'>Membre depuis le..</span>
	         </div>
			   </div>      
			   
			   
			   
			   <div class='col-xs-12 col-lg-6'>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><b>Antoine Bonte</b></h4>
		 	   <p>antoine.bonte@univ-lille1.fr</p>	 	  
		 	   <span class='pull-right small'>Membre depuis le..</span>
	         </div>
			   </div>     
			   
			   <div class='col-xs-12 col-lg-6'>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><b>Sylvain Coolsaet</b></h4>
		 	   <p>sylvain.coolsaet@univ-lille1.fr</p>	 	  
		 	   <span class='pull-right small'>Membre depuis le..</span>
	         </div>
			   </div>       
          
          </div>


      </div><!--/.col-xs-12.col-lg-8-->
           
          </div><!--/row-->
	
        </div><!--/.sidebar-offcanvas-->
	
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     