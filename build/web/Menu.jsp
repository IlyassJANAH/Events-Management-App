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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<body >
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
                        <li ><a href="Decoration.jsp"><i class="fas fa-lightbulb fa-lg pad"></i> <span>Decoration</span></a> </li>
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
            SELECT * from menu 
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

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-sky">
            <div class="panel-heading">
            
          <h4>Liste des menus </h4>
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
                        <table class="table table-hover" cellpading="0" cellspacing="0" border="0" >
                            <thead>
                                <tr>
                                    <th>Libelle</th>
                                    <th>Designation</th>
                                    <th>Prix</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "row" items = "${result.rows}">
            <tr>
                <td data-title="Country" align="left"> <c:out value = "${row.LibelleMenu}"/></td>
               <td data-title="Country" align="left"> <c:out value = "${row.DesignationMenu}"/></td>
               <td data-title="Country" align="left"> <c:out value = "${row.PrixMenu}"/> DH</td>

               
               <td>
                   <a href="http://localhost:8080/Projet_s3/ModifierMenu.jsp?idMen=<c:out value = "${row.idMenu}"/>" id="modifier" class="edit" title="Modifier" data-toggle="tooltip" style="color: #FFC107;"><i class="material-icons">&#xE254;</i></a>
                   <a onclick="Confirmer( <c:out value = "${row.idMenu}"/>)" class="delete" title="Supprimer" data-toggle="tooltip" style="color: #E34724;"><i class="material-icons">&#xE872;</i></a> 
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
        <h5 class="modal-title" id="exampleModalLongTitle">Ajouter un menu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <!-- *************************************   LE formulaire d'ajout *********************************-->
          <form action="AjouterMenu" method="post">
  <div class="form-group">
    <label >Libellé</label>
    <input type="text" name="Libelle" class="form-control bor" placeholder="Entrer un libellé" required>
  </div>
              
  <div class="form-group">
    <label >Désignation</label>
    <textarea class="form-control bor" name="Designation" id="exampleFormControlTextarea1" rows="3" required></textarea>
  </div>
              
  <div class="form-group">
    <label >Prix</label>
    <input type="number" step="0.01" name="prix" class="form-control bor" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder=" Veuillez Entrer un prix" required>
    <small id="emailHelp"  class="form-text text-muted">Entrer le prix en Dirhams</small>
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



<script>
   <!--  ******************************   Confirmation du suppression et envoie de idDemande ************************************ -->
function Confirmer(id) {
  var txt;
  var r = confirm("Etes-vous sur de vouloir supprimer ce menu ?");
  if (r == true) {
    window.location.href = "http://localhost:8080/Projet_s3/SupprimerMenu?idMen="+id;
  } 
  
}
<!--****************************************  Script pour update **********************************************************-->


</script>
 
</body>
</html>

