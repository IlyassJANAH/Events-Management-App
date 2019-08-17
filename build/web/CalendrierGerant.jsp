<%-- 
    Document   : Calendrier
    Created on : 3 janv. 2019, 19:46:27
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Calendrier</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Avant">
	<meta name="author" content="The Red Team">

    <!-- <link href="assets/less/styles.less" rel="stylesheet/less" media="all">  -->
    <link rel="stylesheet" href="assets/css/styles.css?=140">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css\font-awesome\css\fontawesome-all.min.css">

	 
        <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='styleswitcher'> 
    
            <link href='assets/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='headerswitcher'> 
    
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
	<!--[if lt IE 9]>
        <link rel="stylesheet" href="assets/css/ie8.css">
		<script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
	<![endif]-->

	<!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css' href='assets/plugins/fullcalendar/fullcalendar.css' /> 
<link rel='stylesheet' type='text/css' href='assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='assets/plugins/form-toggle/toggles.css' /> 

<!-- <script type="text/javascript" src="assets/js/less.js"></script> -->

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<link rel="stylesheet" href="css/newCss.css">
       <link rel="stylesheet" href="css\font-awesome\css\fontawesome-all.min.css">
</head>

<body>

    <div id="headerbar">
        <div class="container">
            
        </div>
    </div>

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
                
                <li><a href="CalendrierGerant.jsp"><i class="fas fa-calendar-alt fa-lg pad"></i> <span>Calendrier des demandes</span></a> </li>
                <li><a href="Clients.jsp"><i class="fas fa-users fa-lg pad"></i> <span>Clients</span></a> </li>
   
            </ul>
            <!-- END SIDEBAR MENU -->
        </nav>
<div id="page-content">
    <div id='wrap'>
        <div id="page-heading">
            
            <h1>Calendier</h1>
            
        </div>

        <div class="container">
            <div class="row">
              <div class="col-xs-12">
                <div class="panel panel-danger calendar">
                    <div class="panel-heading">

                        <h4>Calendrier des demandes</h4>
                        <div class="options">
                            
                        </div>
                    </div>
                    <div class="panel-body">
                        <div id='calendar-drag'></div> <!--  le calendrier est remplie depuis \assets\demo\   -->
                    </div>
                </div>
            </div>


            



        </div>

        </div> <!-- container -->
    </div> <!--wrap -->
</div> <!-- page-content -->

    <footer role="contentinfo">
        <div class="clearfix">
            <ul class="list-unstyled list-inline pull-left">
                <li>AVANT &copy; 2015</li>
            </ul>
            <button class="pull-right btn btn-inverse-alt btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
        </div>
    </footer>

</div> <!-- page-container -->

<!--
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script>!window.jQuery && document.write(unescape('%3Cscript src="assets/js/jquery-1.10.2.min.js"%3E%3C/script%3E'))</script>
<script type="text/javascript">!window.jQuery.ui && document.write(unescape('%3Cscript src="assets/js/jqueryui-1.10.3.min.js'))</script>
-->

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
<script type='text/javascript' src='assets/plugins/fullcalendar/fullcalendar.min.js'></script> 
<script type='text/javascript' src='assets/js/placeholdr.js'></script> 
<script type='text/javascript' src='assets/js/application.js'></script> 
<script type='text/javascript' src='assets/demo/demo.js'></script> 
<!-- ****************************   Requete pour selectioner les donnees a Afficher     *************************************** -->
   
  
   
   <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/bd_projet"
         user = "root"  password = ""/>
        <sql:query dataSource = "${test}" var = "result">
            SELECT * from demandeevenement where EtatDemande =0 OR EtatDemande=1
            
         </sql:query>
            
    <!-- *********************************   Fin Requete *         *********************************************** -->

<script type='text/javascript'>
$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	var calendar = $('#calendar-drag').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		selectable: true,
		selectHelper: true,
		select: function(start, end, allDay) {
			var title = prompt('Event Title:');
			if (title) {
				calendar.fullCalendar('renderEvent',
					{
						title: title,
						start: start,
						end: end,
						allDay: allDay
					},
					true // make the event "stick"
				);
			}
			calendar.fullCalendar('unselect');
		},
		editable: true,
		events: [
                    //*************** On affichera les evenements ********************
                        <c:forEach var = "row" items = "${result.rows}">
		
			{
				title: 'Heure : <c:out value = "${row.heureDebutEvent}"/>',//titre Evenement
				start: new Date("<c:out value = "${row.dateDebutEvent}"/>"),//date debut Evenement
				
                                url: 'http://localhost:8080/Projet_s3/DetailDem.jsp?idDem=<c:out value = "${row.idDemande}"/>',//lien de direction vers les informations
				<c:choose>
                    <c:when test="${row.EtatDemande eq 0}">
                            backgroundColor: '#2e5dac'//couleur arriere plan 
                    </c:when>
                    <c:when test="${row.EtatDemande eq 1}">
                            backgroundColor: '#85c744'//couleur arriere plan 
                    </c:when>
                  </c:choose>
			},</c:forEach>
			
		],
		buttonText: {
			prev: '<i class="fa fa-angle-left"></i>',
			next: '<i class="fa fa-angle-right"></i>',
			prevYear: '<i class="fa fa-angle-double-left"></i>',  // <<
			nextYear: '<i class="fa fa-angle-double-right"></i>',  // >>
			today:    'Today',
			month:    'Month',
			week:     'Week',
			day:      'Day'
		}
	});
	
});

</script>













</body>
</html>
