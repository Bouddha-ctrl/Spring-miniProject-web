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
		    <a class="nav-link active" aria-current="page" href="#">Filiere</a>
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
			<h3>Ajout filiere</h3>
		</div>

        <f:form class="row g-3" method="POST" action="${pageContext.request.contextPath}/cadre/filiere/add" modelAttribute="Filiere_model">
			  
			  <div class="col-md-4">
			    <label  class="form-label">Titre</label>
			    <f:input type="text" class="form-control" path="titreFiliere" />
			     <f:errors path="titreFiliere" class="error"/>
			  </div>
			  
			  <div class="col-md-4">
			    <label  class="form-label">Code</label>
			    <f:input type="text" class="form-control" path="codeFiliere" />
			    <f:errors path="codeFiliere" class="error"/>
			  </div>
			  
			  <div class="col-md-4">
			    <label class="form-label">Annee d'accreditation</label>
			    <f:input class="form-control"  path="anneeaccreditation" />
			    <f:errors path="anneeaccreditation" class="error"/>
			  </div>
			  
			  <div class="col-md-4">
			    <label class="form-label">Annee fin d'accreditation</label>
			    <f:input class="form-control" path="anneeFinaccreditation" />
			     <f:errors path="anneeFinaccreditation" class="error"/>
			  </div>
			  
			  
			  
			  <div class="col-12">
			    <button class="btn btn-primary" type="submit">Ajouter</button>
			  </div>
			</f:form>

		<hr class="dottedline" />
		
		<h3>Ajout par fichier JSON</h3>
		
		<div class="row g-3 align-items-center">
			<form class="row g-3" enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/cadre/filiere/addFile">
		
			  <div class="col-auto">
			    <label for="SearchSelect" class="col-form-label">Fichier : </label>
			  </div>
		  
			  <div class="col-auto">
			  		 <input type="file" id="fileJson" name="fileJson" class="form-control form-control-sm" required/>
			  </div>
			  <div class="col-auto">
			  		 <button class="btn btn-primary" type="submit">Ajouter</button>
			  </div>
		  </form>
		</div>
		<hr class="line1" />
		
		<div>
			<h3>Liste des filieres</h3>
		</div>


		<div class="row g-3 align-items-center">
		  <div class="col-auto">
		    <label for="SearchSelect" class="col-form-label">Recherche par</label>
		  </div>
		  <div class="col-auto">
				<select class="form-select form-select-sm" onchange="getSearchValue()" id="SearchSelect" >
					<option  value="idFiliere" >Id Filiere</option>
					<option  value="titreFiliere">Titre Filiere</option>
					<option  value="codeFiliere">Code Filiere</option>
					<option  value="anneeaccreditation">Annee d'accredi</option>
					<option  value="anneeFinaccreditation">Annee fin d'accredi</option>
				</select> 
		  </div>
		  <div class="col-auto"> : </div>
		  <div class="col-auto">
		  		 <input type="text" id="SearchInput" onchange="getSearchValue()" class="form-control form-control-sm" />
		  </div>
		</div>
		
		
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Id Filiere</th>
						<th scope="col">Titre Filiere</th>
						<th scope="col">Code Filiere</th>
						<th scope="col">Annee d'accreditation</th>
						<th scope="col">Annee fin d'accreditation</th>
						<th scope="col"></th>
			
					</tr>
				</thead>
				<c:forEach items="${ListFiliere}" var="f">
					<tr>
						<td><c:out value="${f.idFiliere}" /></td>
						<td><c:out value="${f.titreFiliere}" /></td>
						<td><c:out value="${f.codeFiliere}" /></td>
						<td><c:out value="${f.anneeaccreditation}" /></td>
						<td><c:out value="${f.anneeFinaccreditation}" /></td>
						

						<td>
							<ul>
								<li><a  href="${pageContext.request.contextPath}/cadre/filiere/get/${f.idFiliere}">Plus d'information</a></li>
								<li data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="GetId(id,`filiere`)" id="${f.idFiliere}"><a href="#">Supprimer</a></li>

							</ul>
						</td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</div>
		

	<!-- Modal : Suppression Verification-->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        La supression de ce element supprimera tous son contenu.
	      </div>
	      <div class="modal-footer">
	        <button id="annuler" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
	        <button id="supprimer" type="button" class="btn btn-danger">Supprimer</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Button trigger Jsonfile state Modal -->
	<button type="button" id="modaltrigger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" hidden="true"></button>

		<!-- Modal : JSonFile State -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Alert</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        ${AddFileState}
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Understood</button>
		      </div>
		    </div>
		  </div>
		</div>
		
<input id="filestate" value="${AddFileState}" hidden="true"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
<script path="<%=path%>"  src="<c:url value="/resources/theme1/js/file1.js" />"></script>


</body>
</html>



