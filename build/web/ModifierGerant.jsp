<%-- 
    Document   : reservation
    Created on : 29 nov. 2018, 16:39:49
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>AWGO EVENT</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Avant">
	<meta name="author" content="The Red Team">

    <!-- <link href="assets/less/styles.less" rel="stylesheet/less" media="all">  -->
    <link rel="stylesheet" href="assets/css/styles.css?=140">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
	 <!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='styleswitcher'> 
    
            <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='headerswitcher'> 
            <!-- **************************    jstl pour l'affichage     *******************************-->
            <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 <!--********************************************************************************************************* -->
 <link rel="stylesheet" href="css/newCss.css">
       <link rel="stylesheet" href="css\font-awesome\css\fontawesome-all.min.css">

</head>

<body>
    <%  
     if (session.getAttribute("nom") == null) {  
          response.sendRedirect("login.jsp");
     }
  %>

<!-- ********************************************          MENU             **************************************************** -->
    <div id="page-container">
                    <nav id="page-leftbar" role="navigation" >
                <!-- BEGIN SIDEBAR MENU -->
                <ul class="acc-menu" id="sidebar"  >
                
                <li class="welc"><img src="images/awgo.png" width="240" height="100"></li>
                <li class="divider"></li>
                <li><a href="javascript:;"><i class="fas fa-user-circle fa-lg pad "></i> <span><%= session.getAttribute("nom") %> <%= session.getAttribute("prenom") %></span></a>
                    <ul class="acc-menu">
                        <li><a href="Logout"><i class="fas fa-sign-out-alt"></i> Se déconnecter</a></li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li ><a href="CalendrierGerant.jsp"><i class="fas fa-calendar-alt fa-lg pad"></i> <span>Calendrier des demandes</span></a> </li>
                <li><a href="javascript:;"><i class="fas fa-cubes fa-lg pad "></i> <span>Services</span></a>
                    <ul class="acc-menu">
                        <li><a href="Animation.jsp"><i class="fas fa-music "></i> <span>Animation</span></a> </li>
                        <li><a href="Decoration.jsp"><i class="fas fa-lightbulb"></i> <span>Decoration</span></a> </li>
                        <li><a href="Menu.jsp"><i class="fas fa-utensils "></i> <span>Menu</span></a> </li>
                    </ul>
                </li>
                <li class="active"><a href="Gerants.jsp"><i class="fas fa-users fa-lg pad"></i> <span>Gérants</span></a> </li>

            </ul>
            <!-- END SIDEBAR MENU -->
        </nav>
     
   <!-- ****************************   Requete pour selectioner les donnees a Afficher     *************************************** -->
 
   <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/bd_projet"
         user = "root"  password = ""/>
        <sql:query dataSource = "${test}" var = "result">
            SELECT * from personnes WHERE id=<%= request.getParameter("idGer") %>
         </sql:query>
    <!-- *********************************   Fin Requete *         *********************************************** -->

  <div id="page-content">
    <div id='wrap'>
        <div id="page-heading">
            <ol class="breadcrumb">
                
                <li class="active"></li>
            </ol>

            <h1>Gérants</h1>
            
        </div>

<div class="container">

<div class="panel panel-midnightblue">
    <div class="panel-heading">
        <h4>Modifier gérants</h4>
        
    </div>
    <div class="panel-body collapse in">
        <form action="ModifierGerant" method="post" class="form-horizontal row-border">
            <c:forEach var = "row" items = "${result.rows}">
                <input type="hidden" name="id" value="<c:out value = "${row.id}"/>" ><!-- type hidden pour cacher l id et l'utilise pour update-->
  <div class="form-group">
    <label class="col-sm-3 control-label">Nom</label>
        <div class="col-sm-6">
    <input type="text" name="nom" value="<c:out value = "${row.nom}"/>" required>
  </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-3 control-label">Prénom</label>
    <div class="col-sm-6">
    <input type="text" name="prenom" value="<c:out value = "${row.prenom}"/>" required>
  </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-3 control-label">Adresse</label>
    <div class="col-sm-6">
    <input type="text" name="adresse" value="<c:out value = "${row.adresse}"/>" required>
  </div>
  </div>
  <div class="form-group">
    <label class="col-sm-3 control-label">Date de Naissance</label>
    <div class="col-sm-6">
    <input type="date" name="naissance" value="<c:out value = "${row.DateNaissance}"/>" required>
  </div>
  </div>
  <div class="form-group">
    <label class="col-sm-3 control-label">Date de d'embauche</label>
    <div class="col-sm-6">
    <input type="date" name="embauche" value="<c:out value = "${row.DateEmbauche}"/>" required>
  </div>
  </div>
  <div class="form-group">
    <label class="col-sm-3 control-label">Téléphone</label>
    <div class="col-sm-6">
    <input type="text" name="telephone" value="<c:out value = "${row.telephone}"/>" required>
  </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-3 control-label">Login</label>
    <div class="col-sm-6">
    <input type="text" name="login" value="<c:out value = "${row.login}"/>" required>
  </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-3 control-label">Mot de passe</label>
    <div class="col-sm-6">
    <input type="password" name="mdp" value="<c:out value = "${row.mdp}"/>" required>
  </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-3 control-label">Email</label>
    <div class="col-sm-6">
    <input type="text" name="email" value="<c:out value = "${row.email}"/>" required>
  </div>
  </div>
  
    <div class="modal-footer" style="text-align: left;"> 
      <input type="submit" class="btn btn-primary update"  value="Modifier">
        <button type="button" class="btn btn-secondary bor" data-dismiss="modal"><a href="Gerant.jsp" style="color: #333333;">Annuler</a></button>
    </div> 
  
  </c:forEach>
    </form>
        
    </div>
    
</div>
        </div>
    </div>
</div>

        </div> <!-- container -->

<script type='text/javascript' src='assets/js/jquery-1.10.2.min.js'></script> 
<script type='text/javascript' src='assets/js/application.js'></script> 

<script>
   <!--  ******************************   Confirmation du suppression et envoie de idDemande ************************************ -->
function Confirmer(id) {
  var txt;
  var r = confirm("Etes-vous sur de vouloir supprimer cette Animation ?");
  if (r == true) {
    window.location.href = "http://localhost:8080/Projet_s3/SupprimerAnimation?idAnim="+id;
  } else {
    txt = "You pressed Cancel!";
  }
  
}
<!--****************************************  Script pour update **********************************************************-->


</script>
 
</body>
</html>
