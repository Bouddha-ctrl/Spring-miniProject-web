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
			<h3>Le Niveau</h3>
			<table>
			 <tr><td>Id Filiere </td> <td> : <a href="${pageContext.request.contextPath}/cadre/filiere/get/${NiveauModel.filiere.idFiliere}">${NiveauModel.filiere.idFiliere}</a></td></tr>  
			 <tr><td>Id Niveau </td> <td>: ${NiveauModel.idNiveau}</td></tr>
			 <tr><td>Titre  </td><td> : ${NiveauModel.titre}</td></tr>
			 <tr><td>Alias </td><td> : ${NiveauModel.alias}</td></tr>
			</table>
		</div>
		<button id="modify" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modiferModal" data-bs-whatever="@mdo">Modifier</button>
		
		
		<br/><br/>
		
		<h3>Ajout d'un Module</h3>
		<br/>
		<f:form class="row g-3" method="POST" action="${pageContext.request.contextPath}/cadre/module/add" modelAttribute="Module_Model">
			  
			  <div class="col-md-4">
			    <label  class="form-label">Id Niveau</label>
			    <f:input type="text" name="idniveau" class="form-control" value="${NiveauModel.idNiveau}" path="" readonly="true"/>
			  </div>
			  
			  <div class="col-md-4">
			    <label  class="form-label">Titre</label>
			    <f:input type="text" class="form-control" path="titre" />
			    <f:errors path="titre" class="error"/>
			  </div>
			  
			  <div class="col-md-4">
			    <label  class="form-label">code</label>
			    <f:input type="text" class="form-control" path="code" />
				<f:errors path="code" class="error"/>
			  </div>
			
			  	
			  <div class="col-12">
			    <button class="btn btn-primary" type="submit">Ajouter</button>
			  </div>
			</f:form>
		<br/>
		
		<div>
			<h3>Liste des Modules</h3>
		</div>

		<div>

			<table class="table">
				<thead>
					<tr>
						
						<th scope="col">Id Module</th>
						<th scope="col">Titre</th>
						<th scope="col">Code</th>
						<th scope="col"></th>
			
					</tr>
				</thead>
				<c:forEach items="${NiveauModel.modules}" var="m">
					<tr>
						<td><c:out value="${m.idModule}" /></td>
						<td><c:out value="${m.titre}" /></td>
						<td><c:out value="${m.code}" /></td>

						<td>
							<ul>
								<li><a href="${pageContext.request.contextPath}/cadre/module/get/${m.idModule}">Plus d'information</a></li>
								<li data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="GetId(id)" id="${m.idModule}"><a href="#">Supprimer</a></li>
							</ul>
						</td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</div>

	<!-- Modal delete confirmation-->
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
	
	<!-- Modal Modification -->
	<div class="modal" id="modiferModal" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	        <f:form name="modifyForm" id="modifyForm"  action="${pageContext.request.contextPath}/cadre/niveau/update" class="row g-3" method="POST"  modelAttribute="UpdateNiveauModel">
	      
	      	   <div class="modal-body">
			  
				  <div class="col-md-4">
					<label  class="form-label">Id Niveau</label>
				    <f:input type="text" class="form-control" path="idNiveau" readonly="true"/>
				  </div>
				  
				  <div class="col-md-4">
				    <label  class="form-label">Titre</label>
				    <f:input type="text" class="form-control" path="titre" />
				    <f:errors path="titre" class="error"/>
				  </div>
				  
				  <div class="col-md-4">
				    <label  class="form-label">Alias</label>
				    <f:input type="text" class="form-control" path="alias" />
				    <f:errors path="alias" class="error"/>
				  </div>
					        
				<p id="demo"></p>
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
		      	<button  type="submit" class="btn btn-primary">Modifer</button>
		      </div>
		     </f:form>
	    </div>
	  </div>
	</div>
<input id="checkModal" value="${checkModal}"  hidden="true"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
<script path="<%=path%>" classe="module" src="<c:url value="/resources/theme1/js/file1.js" />"></script>

</body>
</html>