<%-- 
    Document   : Form_reserver
    Created on : 9 déc. 2018, 22:50:25
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Avant</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Avant">
	<meta name="author" content="The Red Team">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- <link href="assets/less/styles.less" rel="stylesheet/less" media="all">  -->
    <link rel="stylesheet" href="assets/css/styles.css">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
	 
    <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='styleswitcher'> 
    
    <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='headerswitcher'> 
    
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
        <link rel="stylesheet" href="css\font-awesome\css\fontawesome-all.min.css">
     <link rel="stylesheet" href="css/newCss.css">

    
</head>

<body>
    <%  
     if (session.getAttribute("nom") == null) {  
          response.sendRedirect("login.jsp");
     }
     
  %>
<!-- ****************************   Requete pour selectioner les donnees a Afficher     *************************************** -->
   <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/bd_projet"
         user = "root"  password = ""/>
            <sql:query dataSource = "${test}" var = "anim">
            SELECT * from animation ;
         </sql:query>
            <sql:query dataSource = "${test}" var = "decor">
            SELECT * from decoration ;
         </sql:query>
         <sql:query dataSource = "${test}" var = "menu">
            SELECT * from menu ;
         </sql:query>
         
         <sql:query dataSource = "${test}" var = "result">
            SELECT * from demandeevenement D,animation A,decoration De,menu U WHERE idDemande=<%= request.getParameter("idDem") %>
            AND D.idClient=<%= session.getAttribute("idClient") %> AND D.idAnimation=A.idAnimation 
            AND D.idDecoration=De.idDecoration AND D.idMenu=U.idMenu
            
         </sql:query>
    <!-- *********************************   Fin Requete *         *********************************************** -->
   
    <div id="page-container">
        <!-- BEGIN SIDEBAR -->
         <nav id="page-leftbar" role="navigation" >
                <!-- BEGIN SIDEBAR MENU -->
            <ul class="acc-menu" id="sidebar" >
                
                <li class="welc"><img src="images/awgo.png" width="240" height="100"></li>
                <li class="divider"></li>
                <li><a href="javascript:;"><i class="fas fa-user-circle fa-lg pad "></i> <span><%= session.getAttribute("nom") %> <%= session.getAttribute("prenom") %></span></a>
                    <ul class="acc-menu">
                        <li><a href="tables-data.htm"><i class="fas fa-edit"></i>Modifier Profile</a></li>
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
<div id="page-content">
    <div id='wrap'>
        <div id="page-heading">
            <ol class="breadcrumb">
                
                <li class="active"></li>
            </ol>

            <h1>Formulaire de réservation</h1>
            
        </div>

        <div class="container">
            <c:forEach var = "row" items = "${result.rows}">
<div class="panel panel-midnightblue">
    <div class="panel-heading">
        <h4>Modifier les informations qui concerne votre événement</h4>
        
    </div>
    <div class="panel-body collapse in">
        <form action="ModifierDemande" method="post" class="form-horizontal row-border">
            
            
            
            <div class="form-group">
                <label class="col-sm-3 control-label">Date de début de votre événement</label>
                <div class="col-sm-6">
                    <div class="input-group date">
                        <input type="hidden" name="idDemande" value="<%= request.getParameter("idDem") %>">
                        <input type="date" name="dateDebut" min="2019-01-13" value="<c:out value = "${row.dateDebutEvent}"/>">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">heure de debut de votre événement</label>
                <div class="col-sm-6">
    <input type="time" id="appt" name="heureDebut" placeholder="Choisissez une heure de début de l'événement" value="<c:out value = "${row.heureDebutEvent}"/>" required>
                    
                </div>
            </div>

           
            <div class="form-group">
                <label class="col-sm-3 control-label">heure de fin de votre événement</label>
                <div class="col-sm-6">
                    <input type="time" id="appt" name="heureFin" placeholder="Choisissez une heure de début de l'événement" value="<c:out value = "${row.heureFinEvent}"/>" required>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Lieu de votre événement</label>
                <div class="col-sm-6">
                    <input type="text" name="lieu" required value="<c:out value = "${row.LieuEvent}"/>">
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-3 control-label">Veuillez estimer le nombre des invites pour votre événement</label>
                <div class="col-sm-6">
                    <input type="number" name="nbrInvite" required value="<c:out value = "${row.NbrInvite}"/>">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Choisissez une animation pour votre événement </label>
                <div class="col-sm-6">
                    <select class="form-control" id="animation" name="animation">
                        <option value=""></option>
                        <c:forEach var = "row" items = "${anim.rows}">
                    		 <option value="<c:out value = "${row.idAnimation}"/>"><c:out value = "${row.LibelleAnimation}"/></option>
                                </c:forEach>              
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-3 control-label">Choisissez un menu pour votre événement </label>
                <div class="col-sm-6">
                    <select class="form-control" id="menu" name="menu">
                        <option value=""></option>
                        <c:forEach var = "row" items = "${menu.rows}">
                    		 <option value="<c:out value = "${row.idMenu}"/>"><c:out value = "${row.LibelleMenu}"/></option>
                                </c:forEach>              
                    </select>
                </div>
            </div>

           
            <div class="form-group">
                <label class="col-sm-3 control-label">Choisissez une decoration pour votre événement </label>
                <div class="col-sm-6">
                    <select class="form-control" id="decoration" name="decoration" >
                        <option value=""></option>
                        <c:forEach var = "row" items = "${decor.rows}">
                    		 <option value="<c:out value = "${row.idDecoration}"/>"><c:out value = "${row.DesignationDecoration}"/></option>
                                </c:forEach>              
                    </select>
                </div>
            </div>
            
		<div class="panel-footer">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="btn-toolbar">
                        <input type="submit" name="Valider" value="Modifier" class="btn-primary btn">
                        <button class="btn-default btn">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        </form>
        
    </div>
    
</div>
</c:forEach>
  
    
  </div><!-- /.modal -->

        </div> <!-- container -->

    </div> <!--wrap -->

</div> <!-- page-content -->

</div> <!-- page-container -->

<!--
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script>!window.jQuery && document.write(unescape('%3Cscript src="assets/js/jquery-1.10.2.min.js"%3E%3C/script%3E'))</script>
<script type="text/javascript">!window.jQuery.ui && document.write(unescape('%3Cscript src="assets/js/jqueryui-1.10.3.min.js'))</script>
-->
<script>
    $( window ).on( "load", function() {
     <c:forEach var = "row" items = "${result.rows}">

       $('#menu').val(<c:out value = "${row.idMenu}"/>);
       $('#decoration').val(<c:out value = "${row.idDecoration}"/>);
       $('#animation').val(<c:out value = "${row.idAnimation}"/>);
          </c:forEach>
});

</script>
</body>
</html>