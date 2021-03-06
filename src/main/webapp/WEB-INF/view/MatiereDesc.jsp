<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<%
	String path = request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" 
	crossorigin="anonymous"/>

<link type="text/css" rel="stylesheet" href="<c:url value="/resources/theme1/css/style.css" />" />

</head>
<body>

	<div class="container">

		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link " href="${pageContext.request.contextPath}/cadre/filiere/list">Filiere</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/cadre/niveau/list">Niveau</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/cadre/module/list">Module</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/cadre/matiere/list">Matiere</a>
		  </li>

		</ul>
		
		<br/>
		<div>
			<h3>
				La Matiere
				<button id="modify"  type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#modiferModal" data-bs-whatever="@mdo">Modifier</button>
			
			</h3>
			<table>
			 <tr><td>Id Module  </td><td> : <a href="${pageContext.request.contextPath}/cadre/module/get/${MatiereModel.module.idModule}">${MatiereModel.module.idModule}</a></td></tr>
			 <tr><td>Id Matiere  </td><td> : ${MatiereModel.idMatiere}</td></tr>
			 <tr><td>Nom   </td><td> : ${MatiereModel.nom}</td></tr>
			 <tr><td>Code  </td><td> : ${MatiereModel.code}</td></tr>
			</table>
			
		</div>
		
		<br/>
		
		
	</div>

	<!-- Modal Modification -->
	<div class="modal fade" id="modiferModal" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	        <f:form class="row g-3" method="POST" action="${pageContext.request.contextPath}/cadre/matiere/update" modelAttribute="UpdateMatiereModel">
	      
	      	   <div class="modal-body">
			  
				  <div class="col-md-4">
					<label  class="form-label">Id Matiere</label>
				    <f:input type="text" class="form-control" path="idMatiere" readonly="true"/>
				  </div>
				  
				  <div class="col-md-4">
				    <label  class="form-label">Nom</label>
				    <f:input type="text" class="form-control" path="nom" />
				    <f:errors path="nom" class="error"/>
				  </div>
				  
				  <div class="col-md-4">
				    <label  class="form-label">code</label>
				    <f:input type="text" class="form-control" path="code" />
				    <f:errors path="code" class="error"/>
				  </div>
					        
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
		      	<button type="submit" class="btn btn-primary">Modifier</button>
		      </div>
		     </f:form>
	    </div>
	  </div>
	</div>
	
<input id="checkModal" value="${checkModal}"  hidden="true"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
<script path="<%=path%>"  src="<c:url value="/resources/theme1/js/file1.js" />"></script>
	
</body>

</html>