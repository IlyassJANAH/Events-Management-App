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
   
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
	 
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

<body >
    <%  
     if (session.getAttribute("nom") == null) {  
          response.sendRedirect("login.jsp");
     }
     
  %>
<!--//***************************************    Menu d'entete   ************************************-->
    
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
                
                <li class="active"><a href="CalendrierGerant.jsp"><i class="fas fa-calendar-alt fa-lg pad"></i> <span>Calendrier des demandes</span></a> </li>
                <li ><a href="Clients.jsp"><i class="fas fa-users fa-lg pad"></i> <span>Clients</span></a> </li>
   
            </ul>
            <!-- END SIDEBAR MENU -->
        </nav>

        <!-- ***************************************************************     FIN MENU         ********************************************* -->

   <!-- ****************************   Requete pour selectioner les donnees a Afficher     *************************************** -->
 <!-- <%= request.getParameter("name") %> recuperer le parametre de l'URL pour selectionner la reservation correspondante -->
   <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/bd_projet"
         user = "root"  password = ""/>
        <sql:query dataSource = "${test}" var = "result">
            SELECT * from demandeevenement D ,animation A,decoration De, menu U,personnes P WHERE
            D.idDemande = <%= request.getParameter("idDem") %> AND D.idClient=P.id AND D.idAnimation=A.idAnimation 
            AND D.idDecoration=De.idDecoration AND D.idMenu=U.idMenu
         </sql:query>
    <!-- *********************************   Fin Requete *         *********************************************** -->
 
  <div id="page-content">
    <div id='wrap'>
        <div id="page-heading">
            <ol class="breadcrumb">
                
                <li class="active"></li>
            </ol>

            <h1>Mes resérvations</h1>
            
        </div>

<div class="container">

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-sky">
            <div class="panel-heading">
                <h4>Détails de la demande</h4>  
          </div> 
            <div class="pane">
            <c:forEach var = "row" items = "${result.rows}">
              
             <div class="col-md-6">
                <div class="panel-heading ">
                <h4>Détails de la demande</h4>  
          </div>

            <div class="panel">
		<div class="list-group"> 
                    <p class="list-group-item"><i class="fas fa-calendar-alt"></i> <b>Date Début :</b> <span style=" float:right;"><c:out value = "${row.dateDebutEvent}"/></span></p>
                    <p class="list-group-item"><i class="fas fa-clock-o"></i> <b>Heure Début :</b> <span style=" float:right;"><c:out value = "${row.heureDebutEvent}"/></span></p> 
                    <p class="list-group-item"><i class="fas fa-clock-o"></i> <b>Heure de Fin :</b> <span style=" float:right;"><c:out value = "${row.heureFinEvent}"/></span></p> 
                    <p class="list-group-item"><i class="fas fa-users"></i> <b>Nombre des invités :</b> <span style=" float:right;"><c:out value = "${row.NbrInvite}"/></span></p>
                    <p class="list-group-item"><i class="fas fa-music"></i> <b>Animation :</b> <span style=" float:right;"><c:out value = "${row.LibelleAnimation}"/></span></p> 
                    <p class="list-group-item"><i class="fas fa-lightbulb"></i> <b>Decoration :</b> <span style=" float:right;"><c:out value = "${row.DesignationDecoration}"/></span></p> 
                    <p class="list-group-item"><i class="fas fa-utensils"></i> <b>Menu :</b> <span style=" float:right;"><c:out value = "${row.LibelleMenu}"/></span></p> 
		</div>
            </div>

            </div>
            <div class="col-md-6">
                <div class="panel-heading">
                <h4>Informations sur le client :</h4>  
          </div>
               
            <div class="panel">
		<div class="list-group"> 
                    <p class="list-group-item"><i class="fas fa-male"></i> <b>Nom :</b> <span style=" float:right;"><c:out value = "${row.nom}"/></span></p> 
                    <p class="list-group-item"><i class="fas fa-male"></i>  <b>prenom :</b> <span style=" float:right;"><c:out value = "${row.prenom}"/></span></p>
                    <p class="list-group-item"><i class="fas fa-phone"></i> <b>telephone :</b> <span style=" float:right;"><c:out value = "${row.telephone}"/></span></p> 
                    <p class="list-group-item"><i class="fas fa-at"></i> <b>Email :</b> <span style=" float:right;"><c:out value = "${row.email}"/></span></p> 
                    <p class="list-group-item"><i class="fas fa-address-card"></i> <b>Adresse :</b> <span style=" float:right;"><c:out value = "${row.adresse}"/></span></p> 
										 
		</div>
            </div>
                    
            </div>
 
       <!--********** Afficher les buttons de confirmation si la demande n'est pas encore confirmee   *************************** -->
  <script>
   <!--  ******************************   Confirmation du suppression et envoie de idDemande ************************************ -->
function Confirmer() {
 
    window.location.href = "http://localhost:8080/Projet_s3/ConfirmerDemande?idDemand="+<c:out value = '${row.idDemande}'/>;
  
}

function Refuser() {
 
    window.location.href = "http://localhost:8080/Projet_s3/RefuserDemande?idDemand="+<c:out value = '${row.idDemande}'/>;
  
}
</script>                  
       ${row.EtatDemande eq 0 ? "<p style='width: 250px;margin-bottom: 20px;margin-left: 30px;'><b>Confirmation de la demande :</b></p>
                <div><button class='btn btn-success btn-label ' onclick='Confirmer()'><i class='fa fa-check'></i> Confirmer</button>
                <button class='btn btn-danger btn-label' style='margin-left: 20px;' onclick='Refuser()'><i class='fa fa-times'></i> Refuser</button></div>" : ""}
     
            </c:forEach>
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
<script type='text/javascript' src='assets/js/jqueryui-1.10.3.min.js'></script> 
<script type='text/javascript' src='assets/js/bootstrap.min.js'></script> 
<script type='text/javascript' src='assets/js/enquire.js'></script> 
<script type='text/javascript' src='assets/js/jquery.cookie.js'></script> 
<script type='text/javascript' src='assets/js/jquery.nicescroll.min.js'></script> 
<script type='text/javascript' src='assets/plugins/codeprettifier/prettify.js'></script> 
<script type='text/javascript' src='assets/plugins/easypiechart/jquery.easypiechart.min.js'></script> 
<script type='text/javascript' src='assets/plugins/sparklines/jquery.sparklines.min.js'></script> 
<script type='text/javascript' src='assets/plugins/form-toggle/toggle.min.js'></script> 
<script type='text/javascript' src='assets/js/placeholdr.js'></script> 
<script type='text/javascript' src='assets/js/application.js'></script> 
<script type='text/javascript' src='assets/demo/demo.js'></script> 

</body>
</html>