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
	
    <!-- <link href="assets/less/styles.less" rel="stylesheet/less" media="all">  -->
    <link rel="stylesheet" href="assets/css/styles.css?=140">
       <link rel="stylesheet" href="css\font-awesome\css\fontawesome-all.min.css">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
	 <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
   

        <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='styleswitcher'> 
    
            <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='headerswitcher'> 
            <!-- **************************    jstl pour l'affichage     *******************************-->
            <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 <!--********************************************************************************************************* -->
    <link rel="stylesheet" href="css/newCss.css">
    <style>
        #page-content{
         height: 750px;
     }
    </style>
</head>

<body >
<!--//***************************************    Menu d'entete   ************************************-->
   <%  
     if (session.getAttribute("nom") == null) {  
          response.sendRedirect("login.jsp");
     }
     
  %>
<!-- ********************************************          MENU             **************************************************** -->
    <div id="page-container" >
       
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
                
                <li class="active"><a href="reservation.jsp"><i class="fas fa-list-alt fa-lg pad "></i> <span>Mes réservations</span></a> </li>
                <li ><a href="Form_reserver.jsp"><i class="fas fa-plus-square fa-lg pad"></i> <span>Réserver</span></a> </li>
   
            </ul>
            <!-- END SIDEBAR MENU -->
        </nav>

        <!-- ***************************************************************     FIN MENU         ********************************************* -->

   <!-- ****************************   Requete pour selectioner les donnees a Afficher     *************************************** -->
  
   <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/bd_projet"
         user = "root"  password = ""/>
        <sql:query dataSource = "${test}" var = "result">
            SELECT * from demandeevenement D, animation A,decoration De,menu U WHERE
            D.idClient=<%= session.getAttribute("idClient") %> AND D.idAnimation=A.idAnimation 
            AND D.idDecoration=De.idDecoration AND D.idMenu=U.idMenu ORDER BY D.dateDebutEvent
            
         </sql:query>
    <!-- *********************************   Fin Requete *         *********************************************** -->
   
  <div id="page-content">
    <div id='wrap'>
        <div id="page-heading">
           
            <h1><strong>Mes réservations</strong></h1>
            
        </div>

<div class="container" >

<div class="row">
    <div class="col-sm-12">
       <div class="panel panel-sky">
           <div class="panel-heading">
            <h4>Liste de l'ensemble de vos réservations </h4>
            </div>
           <div class="panel-body collapse in">
            <div class="tab-content">
                <div class="tab-pane active" id="domvertical">
                    <div class="table-vertical">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    
                                    <th>Date de l'évènement</th>
                                    <th>Heure Début </th>
                                    <th>Heure Fin </th>
                                    <th>Lieu</th>
                                    <th>Nombre des invités</th>
                                    <th>Décoration</th>
                                    <th>Animation</th>
                                    <th>Menu</th>
                                    <th>Total(Dirhams)</th>
                                    <th>Etat</th>
                                    <th>Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var = "row" items = "${result.rows}">
            <tr>
               
               <td> <c:out value = "${row.dateDebutEvent}"/></td>
               <td> <c:out value = "${row.heureDebutEvent}"/></td>
               <td > <c:out value = "${row.heureFinEvent}"/></td>
               <td > <c:out value = "${row.LieuEvent}"/></td>
               <td > <c:out value = "${row.NbrInvite}"/></td>
               <td > <c:out value = "${row.DesignationDecoration}"/></td>
               <td > <c:out value = "${row.LibelleAnimation}"/></td>
               <td > <c:out value = "${row.LibelleMenu}"/></td>
               <td><c:out value = "${row.PrixMenu+row.Prixdecoration+row.PrixAnimation}"/></td>
               <td>
                   <c:choose>
                    <c:when test="${row.EtatDemande eq 0}">
                        <span class="label label-warning" style="font-size: 12px;"><i class="fas fa fa-spinner fa-spin fa-lg"></i>En cours</span>
                    </c:when>
                    <c:when test="${row.EtatDemande eq 1}">
                        <span class="label label-success" style="font-size: 12px;"><i class="fas fa-check fa-lg"></i>Validée</span>
                    </c:when>
                   <c:when test="${row.EtatDemande eq 2}">
                        <span class="label label-danger" style="font-size: 12px;"><i class="fas fa-times fa-lg"></i>Refusée</span>
                    </c:when>
                  </c:choose>
                  
               </td>
               <td>
                   <a href="http://localhost:8080/Projet_s3/ModifierReservation.jsp?idDem=<c:out value = "${row.idDemande}"/>" title="Modifier" style="color: #FFC107;"><i class="material-icons">&#xE254;</i></a>
                   <a onclick="Confirmer( <c:out value = "${row.idDemande}"/>)" title="Supprimer" style="color: #E34724;"><i class="material-icons">&#xE872;</i></a> 
               </td>
            </tr>
         </c:forEach>                                  
                            </tbody>
                           
                        </table>
                    </div>
                </div>
                
            
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
  var r = confirm("Etes-vous sur de vouloir supprimer cette réservation ?");
  if (r == true) {
    window.location.href = "http://localhost:8080/Projet_s3/SupprimerDemande?idDem="+id;
  } else {
    txt = "You pressed Cancel!";
  }
  
}
</script>
</body>
</html>