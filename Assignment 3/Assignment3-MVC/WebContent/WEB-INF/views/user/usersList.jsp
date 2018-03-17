<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
  <body>
  	<div class="jumbotron">
	    <div class="container">
	    	<div id="userList" style="margin-top: 20px;">
		    	<table id="tabellaUtenti" class="table table-hover table-striped dataTable display" >
		    		<thead>
		    			<tr>
		    				<th style="text-align: center; vertical-align: center;"><spring:message code="user.username" text="translation_missing" /></th>
		    				<th style="text-align: center; vertical-align: center;"><spring:message code="user.nome" text="translation_missing" /></th>
		    				<th style="text-align: center; vertical-align: center;"><spring:message code="user.cognome" text="translation_missing" /></th>
		    				<th style="text-align: center; vertical-align: center;"><spring:message code="user.email" text="translation_missing" /></th>
		    				<th style="text-align: center; vertical-align: center;"></th>
		    				<th style="text-align: center; vertical-align: center;"></th>
		    			</tr>
		    		</thead>
		    		<tbody>
		    			<c:forEach items="${userList}" var="userVar" varStatus="indexUtente">
		    				<tr>
		    					<td style="text-align: center; vertical-align: center;">${userVar.username}</td>
		    					<td style="text-align: center; vertical-align: center;">${userVar.name}</td>
		    					<td style="text-align: center; vertical-align: center;">${userVar.surname}</td>
		    					<td style="text-align: center; vertical-align: center;">${userVar.email}</td>
		    					<td style="text-align: center; vertical-align: center;">
		    						<button type="button" class="btn btn-info" onclick="vediDettagli('${userVar.id}','${userVar.username}','${userVar.name}','${userVar.surname}','${userVar.email}','${userVar.country}','${userVar.city}','${userVar.address}','${userVar.role}');">
		    							<span class="glyphicon glyphicon-th-list"></span>&nbsp;<spring:message code="admin.vediDettagli" text="translation_missing" />
		    						</button>
		    					</td>
		    					<td style="text-align: center; vertical-align: center;">
		    						<c:choose>
		    							<c:when test="${userVar.role == 'USER'}">
				    						<button type="button" class="btn btn-danger" onclick="eliminaUser('${userVar.id}');">
				    							<span class="glyphicon glyphicon-trash"></span>&nbsp;<spring:message code="admin.eliminaUser" text="translation_missing" />
				    						</button>
			    						</c:when>
			    						<c:otherwise>
			    							
			    						</c:otherwise>
		    						</c:choose>
		    					</td>
		    				</tr>
		    			</c:forEach>
		    		</tbody>
		    	</table>
	    	</div>
	    
	    </div>
	</div>
	
	<div class="modal" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="userModalTitle">
						<spring:message code="admin.vediDettagli" text="translation_missing" />
						<span role="button" class="pull-right" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></span>
					</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="userIdDett" />
					<table class="table table-striped table-bordered table-hover" style="margin-bottom: 0px;">
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.username" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="usernameDett"></td>
						</tr>
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.nome" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="nameDett"></td>
						</tr>
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.cognome" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="surnameDett"></td>
						</tr>
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.email" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="emailDett"></td>
						</tr>
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.nazione" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="countryDett"></td>
						</tr>
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.citta" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="cityDett"></td>
						</tr>
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.indirizzo" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="addressDett"></td>
						</tr>
						<tr>
							<th class="col-md-6" style="text-align: center;"><spring:message code="user.ruolo" text="translation_missing" /></th>
							<td class="col-md-6" style="text-align: center;" id="roleDett"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger pull-right" onclick="eliminaUser();" id="btnEliminaUserModal">
						<spring:message code="admin.eliminaUser" text="translation_missing" />
					</button>
				</div>
			</div>
		</div>
	</div>
	
    <script src='<c:url value="/resources/js/user/userList.js" />'></script>
</body>
</html>