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
    <link rel="stylesheet" href="css\font-awesome\css\fontawesome-all.min.css">

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
                
                <li class="welc" style="margin-top: 80px;">Events</li>
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

        <!-- ***************************************************************     FIN MENU         ********************************************* -->

   <!-- ****************************   Requete pour selectioner les donnees a Afficher     *************************************** -->
   
  
   
   <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/bd_projet"
         user = "root"  password = ""/>
        <sql:query dataSource = "${test}" var = "result">
            SELECT * from personnes WHERE type="Gerant" 
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

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-sky">
           <div class="panel-heading">
             <h4>Liste des Gérants</h4>
           </div>
            <div class="panel-body collapse in">
                 <button type="button" class="btn btn-info " data-toggle="modal" data-target="#exampleModalCenter" style="float: right;
		height: 30px;           
		font-weight: bold;
		font-size: 12px;
		text-shadow: none;
		min-width: 100px;
		border-radius: 50px;
		line-height: 13px;"><i class="fa fa-plus"></i> Ajouter</button>
               <!-- du css pour le boutton ajouter   -->
         
            <div class="tab-content">
                <div class="tab-pane active" id="domvertical">
                    <div class="table-vertical">
                        <table class="table table-hover" >
                            <thead>
                                <tr>
                                   
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Date de naissance</th>
                                    <th>Date d'embauche</th>
                                    <th>Adresse</th>
                                    <th>Telephone</th>
                                    <th>Email</th>
                                    <th>Action</th>
                                 </tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "row" items = "${result.rows}">
            <tr>
                <td > <c:out value = "${row.nom}"/></td>
               <td > <c:out value = "${row.prenom}"/></td>
               <td > <c:out value = "${row.DateNaissance}"/></td>
               <td > <c:out value = "${row.DateEmbauche}"/></td>
               <td > <c:out value = "${row.adresse}"/></td>
               <td > <c:out value = "${row.telephone}"/></td>
               <td > <c:out value = "${row.email}"/></td>
               	
               <td>
                   <a href="http://localhost:8080/Projet_s3/ModifierGerant.jsp?idGer=<c:out value = "${row.id}"/>" id="modifier" class="edit" title="Modifier" style="color: #FFC107;"><i class="material-icons">&#xE254;</i></a>
                   <a onclick="Confirmer( <c:out value = "${row.id}"/>)" class="delete" title="Supprimer"  style="color: #E34724;"><i class="material-icons">&#xE872;</i></a> 
               </td>
      
            </tr>
         </c:forEach>     
         
                            </tbody>
                            
                        </table>
                    </div>
                </div>
<!-- *************************  LA fentre de form *************************************************************  -->   
   <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Ajouter un Gerant</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <!-- *************************************   LE formulaire d'ajout *********************************-->
          <form action="AjouterGerant" method="post">
  <div class="form-group">
    <label >Nom</label>
    <input type="text" class="form-control bor" name="nom" placeholder="Nom..." required>
  </div>
              
  <div class="form-group">
    <label >prénom</label>
    <input type="text" class="form-control bor" name="prenom" placeholder="Prénom..." required>
  </div>
    
   <div class="form-group">
    <label >Date de Naissance</label>
    <input type="date" class="form-control bor" name="naissance" placeholder="Date Naissance" required>
  </div>         
    
   <div class="form-group">
    <label >Date d'embauche</label>
    <input type="date" class="form-control bor" name="embauche" placeholder="Date d'embauche" required>
  </div>           
              
  <div class="form-group">
    <label >Adresse</label>
    <input type="text" class="form-control bor" name="adresse" placeholder="Adresse..." required>
  </div>
              
  <div class="form-group">
    <label >Téléphone</label>
    <input type="text" class="form-control bor" name="telephone" placeholder="Numéro de téléphone..." required>
  </div>
              
  <div class="form-group">
    <label >Email</label>
    <input type="text" class="form-control bor" name="email" placeholder="Email..." required>
  </div>
              
  <div class="form-group">
    <label >Login</label>
    <input type="text" class="form-control bor" name="login" placeholder="Login..." required>
  </div>
              
  <div class="form-group">
    <label >Mot de passe</label>
    <input type="password" class="form-control bor" name="mdp" placeholder="Mot de passe..." required>
  </div>

  <div class="modal-footer"> 
      <input type="submit" class="btn btn-primary bor" name="Ajouter">
        <button type="button" class="btn btn-secondary bor" data-dismiss="modal">Annuler</button>
      </div>
    </form>
          
           <!-- *************************************   LE formulaire d'ajout *********************************-->
           
      </div>
      
    </div>
  </div>
</div>
 <!-- *************************  LA fentre de form *************************************************************  -->   
            </div>
          </div>
        </div>
        </div>
    </div>
</div>



        </div> <!-- container -->
    </div> <!--wrap -->
</div> <!-- page-content -->

</div> <!-- page-container -->
<script type='text/javascript' src='assets/js/jquery-1.10.2.min.js'></script> 

<script type='text/javascript' src='assets/js/application.js'></script> 

<script>
   <!--  ******************************   Confirmation du suppression et envoie de idDemande ************************************ -->
function Confirmer(id) {
  var txt;
  var r = confirm("Etes-vous sur de vouloir supprimer cette Animation ?");
  if (r == true) {
    window.location.href = "http://localhost:8080/Projet_s3/SupprimerPersonne?idPers="+id;
  } 
  
}
<!--****************************************  Script pour update **********************************************************-->


</script>
 
</body>
</html>
