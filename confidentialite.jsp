<%@include file="template/header.jsp" %>
<div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
	    <%
	  String param = request.getParameter("etat");
	  if(param != null){
	  if(param.equals("ok")){
	  out.println("<div class='alert alert-success' role='alert'>Votre confidentialité à bien été modifiée !</div>");
	  }else{
		 out.println("<div class='alert alert-warning' role='alert'>Oups ! Votre confidentialité n'as pas été modifiée !</div>");
	  }
	  }
	  %>    
          <div class="jumbotron">
              <h1>Confidentialité de votre mur</h1><br/>
                   
           <div style="margin:40px 0 40px 0;">


	    <%@ page import="java.sql.*, java.io.*, java.net.*" %>
	   <%@ page import="db.Connexion" %>
    	<%
	 	try{
	 	   Connexion c = new Connexion();
			c.connect();
			String user = request.getRemoteUser();  
			String requete="SELECT libelle FROM visibilitee WHERE utilisateur=(SELECT idutilisateur FROM utilisateurs WHERE email=?);";
		        Connection cc = c.getConnection();
			PreparedStatement ps = cc.prepareStatement(requete);
			ps.setString(1,user);
			ResultSet rs = ps.executeQuery();
			String disp;
		
			if(rs.next()){			
			out.println("<span> Etat actuel : " + rs.getString("libelle"));
			}
			}catch(Exception e){
			out.println("<h1>" + e + "</h2>");
			}
			%>
           <h3>Modifier l'état</h3>
           </br>
	   <form action="servlet/confidentialite" method="post" class="">
	   <SELECT class="form-control" name="etat" size="1">
	   <option value="Public">Public </option>
	   <option value="Amis">Amis</option>
	   <option value="Privée">Privé</option>
	   </SELECT>
	   <input style="display:none;" name="utilisateur" value="<%=request.getRemoteUser()%>" />
	   </br>	   
	   <button type="submit" class="btn btn-primary btn-md">OK</button>
	   </form>
	   
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
     