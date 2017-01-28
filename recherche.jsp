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
 
     <form action="" method="post" name="form" id="form" class="navbar-form form-signin">
          
            <input name="recherche" type="text" class="form-control" placeholder="Email">
            <button type="submit" class="btn btn-primary btn-md">OK</button>
              
     </form>	
   	<div name="display" style="margin-top:10%;">
      <%@ page import="java.sql.*, java.io.*, java.net.*" %>
	   <%@ page import="db.Connexion" %>
    	<%
	 	try{
	      Connexion c = new Connexion();
			c.connect();
			String user = request.getRemoteUser();  
			String rch = request.getParameter("recherche");
			rch +="%";
			String req1 ="select * from utilisateurs where email LIKE ? ;";	
			Connection cc = c.getConnection();
			PreparedStatement ps = cc.prepareStatement(req1);
			ps.setString(1, rch);
			ResultSet rs = ps.executeQuery();
         while(rs.next()){
			%>          
        
				<div class='col-xs-12 col-lg-6'>
	     	   <img src='avatar.jpg' style='width:60px;float:left;' class='img-responsive img-thumbnail' alt='Cinque Terre'>
	    	   <div class='col-xs-12 col-lg-10'>
	   	   <h4><a href='mur-vue.jsp?id=<%= rs.getString("idutilisateur") %>' style=""><b><%= rs.getString("prenom") + " " + rs.getString("nom") %></b></a></h4>
		 	   <p><%= rs.getString("email") %></p> 	  
		 	   <span class='pull-right small'>Membre depuis le (pas dans la bdd)</span>
	         </div>
			   </div>  
			  <% }
			  }catch(Exception e){
			  } %>			 
		</div><!-- .display    -->  
      	</div><!--/.col-xs-12.col-lg-8-->          
          </div><!--/row-->
	
        </div><!--/.sidebar-offcanvas-->
	
     </div><!--/row-->
      <hr>
  <%@include file="template/footer.inc" %>
     