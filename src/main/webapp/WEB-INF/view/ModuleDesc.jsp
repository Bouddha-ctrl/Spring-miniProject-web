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
			<h3>Le Module</h3>
			<br/>Id Niveau: <a href="${pageContext.request.contextPath}/cadre/niveau/get/${ModuleModel.niveau.idNiveau}">${ModuleModel.niveau.idNiveau}</a>
			<br/>Id Module: ${ModuleModel.idModule}
			<br/>Titre  : ${ModuleModel.titre}
			<br/>code : ${ModuleModel.code}
		</div>
		
		<br/>
		
		<h3>Ajout d'une Matiere</h3>
		<br/>
		<f:form class="row g-3" method="POST" action="${pageContext.request.contextPath}/cadre/matiere/add?idmodule=${ModuleModel.idModule}" modelAttribute="Matiere_Model">
			  
			  <div class="col-md-4">
			    <label  class="form-label">Id Module</label>
			    <input type="text"  class="form-control" value="${ModuleModel.idModule}" disabled/>
			  </div>
			  
			  <div class="col-md-4">
			    <label  class="form-label">Nom</label>
			    <f:input type="text" class="form-control" path="nom" />
			    <f:errors path="nom" class="error"/>
			  </div>
			  
			  <div class="col-md-4">
			    <label  class="form-label">Code</label>
			    <f:input type="text" class="form-control" path="code" />
			    <f:errors path="code" class="error"/>
			  </div>
			
			  	
			  <div class="col-12">
			    <button class="btn btn-primary" type="submit">Ajouter</button>
			  </div>
			</f:form>
		<br/>
		
		<div>
			<h3>Liste des Matieres</h3>
		</div>

		<div>

			<table class="table">
				<thead>
					<tr>
						
						<th scope="col">Id Matiere</th>
						<th scope="col">Nom</th>
						<th scope="col">Code</th>
						<th scope="col"></th>
			
					</tr>
				</thead>
				<c:forEach items="${ListMatiere}" var="m">
					<tr>
						<td><c:out value="${m.idMatiere}" /></td>
						<td><c:out value="${m.nom}" /></td>
						<td><c:out value="${m.code}" /></td>

						<td>
							<ul>
								<li><a href="${pageContext.request.contextPath}/cadre/matiere/get/${m.idMatiere}">Plus d'information</a></li>
								<li data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="GetId(id)" id="${m.idMatiere}"><a href="#">Supprimer</a></li>
							</ul>
						</td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        La supression de cet element supprimera tous son contenu
	      </div>
	      <div class="modal-footer">
	        <button id="annuler" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
	        <button id="supprimer" type="button" class="btn btn-danger">Supprimer</button>
	      </div>
	    </div>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
<script path="<%=path%>" classe="matiere" src="<c:url value="/resources/theme1/js/file1.js" />"></script>

</body>
</html>