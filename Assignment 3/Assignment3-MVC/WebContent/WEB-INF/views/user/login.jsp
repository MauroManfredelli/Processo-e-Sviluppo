<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
  <body>
    <div class="jumbotron">
	    <div class="container">
	    	<div class="panel panel-default col-md-offset-3 col-md-6" style="margin-top: 10px;">
	    		<div class="panel-body">
	    			<form:form class="form-horizontal" action="/Assignment3-MVC/modificaDati" modelAttribute="loginUser" id="modificaDatiForm">
	    				<form:hidden path="id"/>
	    				<form:hidden path="role"/>
		          		<input type="hidden"
		                     name="${_csrf.parameterName}" value="${_csrf.token}" />
		    			<div class="form-group" style="text-align: center; vertical-align: center;">
		    				<img alt="user" src='<c:url value="resources/img/user.png"></c:url>' style="width: 40%;" />
		    			</div>
		    			<div class="form-group col-md-12" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.username" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="username" value="${loginUser.username}" class="form-control" disabled="true" onblur="validUsername('${loginUser.id}');" /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12 hidden" id="fieldPassword" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.password" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="password" type="password" value="${loginUser.password}" class="form-control" disabled="true" /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12 hidden" id="fieldRipetiPassword" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.rieptiPassword" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><input name="repPassword" type="password" value="${loginUser.password}" class="form-control" disabled /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.nome" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="name" value="${loginUser.name}" class="form-control" disabled="true" /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.cognome" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="surname" value="${loginUser.surname}" class="form-control" disabled="true" /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.email" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="email" value="${loginUser.email}" class="form-control" disabled="true" onblur="validEmail('${loginUser.id}');" /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12 hidden" id="fieldRipetiEmail" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.rieptiPassword" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><input name="repEmail" type="text" value="${loginUser.email}" class="form-control" disabled /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.nazione" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="country" value="${loginUser.country}" class="form-control" disabled="true" /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.citta" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="city" value="${loginUser.city}" class="form-control" disabled="true" /></span>
		    				</h4>
		    			</div>
		    			<div class="form-group col-md-12" style="text-align: center; vertical-align: center;">
		    				<h4>
		    					<label class="col-md-5" style="text-align: right; margin-top: 10px;"><spring:message code="user.indirizzo" text="translation_missing" />:</label>
		    					<span class="col-md-7" style="text-align: left;"><form:input path="address" value="${loginUser.address}" class="form-control" disabled="true" /></span>
		    				</h4>
		    			</div>
		    			<div class="col-md-12" style="text-align: center; margin-top: 20px;">
		    				<button type="button" id="btnEnableModifica" class="btn btn-warning" onclick="enableModificaDati()"><span class="glyphicon glyphicon-pencil"></span>&nbsp;<spring:message code="user.modificaDati" text="translation_missing" /></button>
		    				<button type="button" id="btnAnnullaModifica" class="btn btn-default hidden" onclick="annullaModificaDati()"><span class="glyphicon glyphicon-remove"></span>&nbsp;<spring:message code="user.annullaModifica" text="translation_missing" /></button>
		    				<button type="submit" id="btnSalvaModifica" class="btn btn-success hidden" onclick="salvaModificaDati()"><span class="glyphicon glyphicon-ok"></span>&nbsp;<spring:message code="user.salvaModificaDati" text="translation_missing" /></button>
			    			<c:if test="${sessionUser.role == 'ADMIN'}">
			    				<button type="button" id="btnListaUtenti" class="btn btn-primary" onclick="userList()"><span class="glyphicon glyphicon-align-justify"></span>&nbsp;<spring:message code="admin.listaUtenti" text="translation_missing" /></button>
			    			</c:if>
		    			</div>
		    		</form:form>
	    		</div>
	    	</div>
	    </div>
    </div>
    
    <script src='<c:url value="/resources/js/user/login.js" />'></script>
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