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
<style>
        #page-content{
         height: 750px;
     }
    </style>

</head>

<body class="">
<!-- ********************************************          MENU             **************************************************** -->
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
                
                <li ><a href="CalendrierAdmin.jsp"><i class="fas fa-calendar-alt fa-lg pad"></i> <span>Calendrier des demandes</span></a> </li>
                 <li class="divider"></li>
                        <li ><a href="Animation.jsp"><i class="fas fa-music fa-lg pad"></i> <span>Animation</span></a> </li>
                        <li><a href="Decoration.jsp"><i class="fas fa-lightbulb fa-lg pad"></i> <span>Decoration</span></a> </li>
                        <li class="active"><a href="Menu.jsp"><i class="fas fa-utensils fa-lg pad"></i> <span>Menu</span></a> </li>
                  <li class="divider"></li>   
                <li><a href="Gerants.jsp"><i class="fas fa-users fa-lg pad"></i> <span>Gérants</span></a> </li>

            </ul>
            <!-- END SIDEBAR MENU -->
        </nav>

        <!-- ***************************************************************     FIN MENU         ********************************************* -->

   <!-- ****************************   Requete pour selectioner les donnees a Afficher     *************************************** -->
 
   <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/bd_projet"
         user = "root"  password = ""/>
        <sql:query dataSource = "${test}" var = "result">
            SELECT * from menu WHERE idMenu=<%= request.getParameter("idMen") %>
         </sql:query>
    <!-- *********************************   Fin Requete *         *********************************************** -->

  <div id="page-content">
    <div id='wrap'>
        <div id="page-heading">
            <ol class="breadcrumb">
                
                <li class="active"></li>
            </ol>

            <h1>Menus</h1>
            
        </div>

<div class="container">

<div class="panel panel-midnightblue">
    <div class="panel-heading">
        <h4>Modifier Menu</h4>
        
    </div>
    <div class="panel-body collapse in">
        <form action="ModifierMenu" method="post" class="form-horizontal row-border">
            <c:forEach var = "row" items = "${result.rows}">
                <input type="hidden" name="id" value="<c:out value = "${row.idMenu}"/>" ><!-- type hidden pour cacher l id et l'utilise pour update-->
  <div class="form-group">
     <label class="col-sm-3 control-label">Libellé</label>
    <div class="col-sm-6">
     <input type="text" name="Libelle" placeholder="Entrer un libellé" value="<c:out value = "${row.LibelleMenu}"/>" required>
    </div>
    </div>
              
  <div class="form-group">
       <label class="col-sm-3 control-label">Désignation</label>
          <div class="col-sm-6">
       <textarea name="Designation" id="exampleFormControlTextarea1" rows="3" required><c:out value = "${row.DesignationMenu}"/></textarea>
  </div>
  </div>
              
  <div class="form-group">
     <label class="col-sm-3 control-label">Prix</label>
    <div class="col-sm-6">
     <input type="number" step="0.01" name="prix" placeholder=" Veuillez Entrer un prix" value="<c:out value = "${row.PrixMenu}"/>" required>
     <br>   <small id="emailHelp"  class="form-text text-muted">Entrer le prix en Dirhams</small>
  </div>
  </div>

  <div class="modal-footer" style="text-align: left;"> 
      <input type="submit" class="btn btn-primary bor update"  value="Modifier">
        <button type="button" class="btn btn-secondary bor" data-dismiss="modal"><a href="Animation.jsp" style="color: #333333;">Annuler</a></button>
      </div>
  </c:forEach>
    </form>
        
    </div>
    
</div>
        </div>
    </div>
</div>

        </div> <!-- container -->
    </div> <!--wrap -->
</div> <!-- page-content -->

</div> <!-- page-container -->

<script>
   <!--  ******************************   Confirmation du suppression et envoie de idDemande ************************************ -->
function Confirmer(id) {
  var txt;
  var r = confirm("Etes-vous sur de vouloir supprimer ce menu ?");
  if (r == true) {
    window.location.href = "http://localhost:8080/Projet_s3/SupprimerMenu?idMen="+id;
  } else {
    txt = "You pressed Cancel!";
  }
  
}
<!--****************************************  Script pour update **********************************************************-->


</script>
 
</body>
</html>

