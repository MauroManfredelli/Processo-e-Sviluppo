<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
  <head>
  	<link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />" type="image/x-icon"/>
    <title>Assignment 3</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/lib/bootstrap/bootstrap.min.css" />">
	<!-- Datatables CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/lib/datatables/jquery.dataTables.min.css" />">
	
	<!-- Stile generico dell'applicazione -->
	<link rel="stylesheet" href="<c:url value="/resources/css/generic.css" />">
  </head>
  
  <body>
  	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="navbar-brand" style="color: white;"><p><img alt="home" src='<c:url value="resources/img/home.png"></c:url>' style="width: 50px; margin-top: -12px;" class="filter">&nbsp;&nbsp;<spring:message code="index.title" text="translation_missing" /></p></span>
        </div>
        <c:choose>
        	<c:when test="${sessionUser == null}">
		        <div id="navbar" class="navbar-collapse collapse">
		          <form class="navbar-form navbar-right" id="loginForm" action="/Assignment3-MVC/login" method="POST">
		          	<input type="hidden"
		                     name="${_csrf.parameterName}" value="${_csrf.token}" />
		            <div class="form-group">
		              <input type="text" placeholder="Username" id="usernameLogin" name="username" class="form-control" >
		            </div>
		            <div class="form-group">
		              <input type="password" placeholder="Password" id="passwordLogin" name="password" class="form-control" >
		            </div>
		            <button type="button" class="btn btn-success" onclick="login();"><spring:message code="user.login" text="translation_missing" /></button>
		          </form>
		        </div><!--/.navbar-collapse -->
	        </c:when>
	        <c:otherwise>
	        	<div id="navbar" class="navbar-collapse collapse">
		          <form class="navbar-form navbar-right">
		            <button type="button" class="btn btn-success" onclick="logout();"><spring:message code="user.logout" text="translation_missing" /></button>
		          </form>
		          <span class="navbar-brand navbar-right" style="color: white;">
			       	<span role="button" onclick="userPage()">
			       		<span class="glyphicon glyphicon-user"></span> <c:out value="${sessionUser.name}"></c:out>
			       	</span>
			      </span>
		        </div><!--/.navbar-collapse -->
	        </c:otherwise>
        </c:choose>
      </div>
    </nav>
    
  	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="<c:url value="/resources/lib/jquery/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/jquery/jquery.validate.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/popper/popper.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/bootstrap/bootstrap.min.js" />"></script>
    <!-- Datatables JS -->
    <script src="<c:url value="/resources/lib/datatables/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/lib/datatables/dataTables.bootstrap.min.js"/>"></script>
  	<!-- Sweetalert2 -->
  	<script src="<c:url value="/resources/lib/sweetalert2/sweetalert2.all.js"/>"></script>
  	<!-- Funzioni generiche dell'applicazione -->
  	<script src='<c:url value="/resources/js/generic.js" />'></script>
  	
  	<sitemesh:write property='body'/>
  	
  	<footer class="footer">
      <div class="container">
        <div class="col-md-5">
        	<spring:message code="footer.uno" text="translation_missing" />
        </div>
        <div class="col-md-4">
        	<spring:message code="footer.due" text="translation_missing" />
        </div>
        <div class="col-md-3">
        	<spring:message code="footer.tre" text="translation_missing" />
        </div>
      </div>
    </footer>
  </body>
</html>