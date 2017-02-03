<%@include file="template/header.jsp" %>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>

	   <%
	  String param = request.getParameter("etat");
	  if(param != null){
	  if(param.equals("true")){
	  out.println("<div class='alert alert-success' role='alert'>Changement d'image bien pris en compte !</div>");
	  }else{
	   out.println("<div class='alert alert-danger' role='alert'>Oups ! Une erreur à eu lieu !</div>");
	  }	
	  }
	  %>
	
          <div class="jumbotron">
              <h1>Vos images</h1><br/>
	        
           <div style="margin:40px 0 40px 0;"> 
          
           <p>Changer de photo de profil</p>

	   <form action="servlet/upload" method="post" name="form" id="form" class="form" enctype="multipart/form-data">
	  <input name="file" type="file" id="file" class="form-control" required>
	   <input name="pic" type="text" id="pic" class="form-control" value="profil" ><br/>
	   <input name="email" type="text" style="display:none;" id="email" class="form-control" value="<%=request.getRemoteUser() %>" ><br/>
       	   <button class="btn btn-primary btn-md" style="margin-top:40px;" type="submit" id="btnenvoi" name="envoi">Envoyer</button>
   	 </form>

           </div>
	      
	   <div style="margin:40px 0 40px 0;">          
           <p>Changer de photo de couverture</p>

	   
	   <form action="servlet/upload" method="post" name="form" id="form" class="form" enctype="multipart/form-data">
	  <input name="mdp" type="file" id="mdp" class="form-control" placeholder="Mot de passe" required>
	  <input name="pic" type="text" id="pic" class="form-control" value="couverture" ><br/>
	   <input name="email" type="text" style="display:none;" id="email" class="form-control" value="<%=request.getRemoteUser() %>" ><br/>
       	   <button class="btn btn-primary btn-md" style="margin-top:40px;" type="submit" id="btnenvoi" name="envoi">Envoyer</button>
   	 </form>

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
     