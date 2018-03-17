<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
  <body>
    <div class="jumbotron">
      <div class="container">
      	<div class="col-md-6">
      		<img alt="disco" src='<c:url value="resources/img/disco.png"></c:url>' style="margin: 20px; width: 95%; margin-top: 50px;" />
      	</div>
      	<div class="col-md-6 panel panel-default panel-body" style="margin-top: 10px;">
      		<form:form class="form-horizontal" action="/Assignment3-MVC/signin" modelAttribute="newUser" id="signinForm">
          		<input type="hidden"
                     name="${_csrf.parameterName}" value="${_csrf.token}" />
		        <div class="col-md-12"><h2><spring:message code="index.registrati" text="translation_missing" /></h2></div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="username" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.username" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="username" class="form-control" type="text" placeholder="Username" onblur="validUsername();" />
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="password" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.password" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="password" class="form-control" type="password" placeholder="Password"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="repPassword" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.rieptiPassword" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<input name="repPassword" class="form-control" type="password" placeholder="Password"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="name" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.nome" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="name" class="form-control" type="text" placeholder="Name"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="surname" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.cognome" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="surname" class="form-control" type="text" placeholder="Surname"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="email" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.email" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="email" class="form-control" type="text" placeholder="Email" onblur="validEmail();" />
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="repEmail" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.ripetiEmail" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<input name="repEmail" class="form-control" type="text" placeholder="Email"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="country" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.nazione" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="country" class="form-control" type="text" placeholder="Country"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="city" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.citta" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="city" class="form-control" type="text" placeholder="City"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
			        <h4>
			        	<label for="address" class="col-md-5" style="text-align: right; margin-top: 8px;">
			        		<spring:message code="user.indirizzo" text="translation_missing" />:
			        	</label>
			        </h4>
			        <div class="col-md-7">
			        	<form:input path="address" class="form-control" type="text" placeholder="Address"/>
			        </div>
		        </div>
		        <div class="col-md-12 form-group">
		        	<div class="col-md-offset-5 col-md-7">
		        		<br>
		        		<button type="submit" class="btn btn-success col-md-6"><spring:message code="user.registrati" text="translation_missing" /></button>
		        	</div>
		        </div>
	        </form:form>
        </div>
      </div>
    </div>
    
    <script src='<c:url value="/resources/js/index.js" />'></script>
    <script>
	    $(document).ready(function() {
	    	var error = "${error}";
	    	if(error != '') {
	    		swal({
	    		  type: 'error',
	    		  title: 'ERRORE',
	    		  text: error,
	    		  showConfirmButton: true,
	    		  timer: 3000
	    		});
	    	}
	    });
    </script>
  </body>
</html>