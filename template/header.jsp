<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="Clément Cantraine" >
    <!--<link rel="icon" href="../../favicon.ico">-->

    <title>The DA2I Social Network</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS personnel -->
    <link href="css/style.css" rel="stylesheet">
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!--<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">-->

    <!-- Custom styles for this template -->
    <link href="css/offcanvas.css" rel="stylesheet">

  <body>
    
    <nav class="navbar navbar-fixed-top navbar-inverse" style="background-color: #AE2573;">
      <div class="container"> 
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">TDSN</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          <%
          if(request.getRemoteUser() ==null){ %>
            <li class="active"><a href="/TDSN/index.jsp">Accueil</a></li>         
				<%}else{%>
				 <li class="active"><a href="/TDSN/fil.jsp">Accueil</a></li>     
				<%}
			 %>  	        
          </ul>
             <%
          if(request.getRemoteUser() ==null){
          	%>
          	<a class="navbar-form navbar-right" href="/TDSN/fil.jsp">Se connecter</a>
          	<%
          }else{ %>
          	  <form action="recherche.jsp" method="post" class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Rechercher quelqu'un de Lille 1">
            <button type="submit" class="btn btn-primary btn-md">OK</button>
          </form>	
         <% }
          %>	   
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

    <div class="container">
<!-- fin header.inc -->
