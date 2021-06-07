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
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
	
<style>
		.error {color : red}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link "  href="${pageContext.request.contextPath}/cadre/filiere/list">Filiere</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="">Niveau</a>
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
			<h3>Liste des Niveaux</h3>
		</div>

		<div>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">titre Filiere</th>
						<th scope="col">Id Niveau</th>
						<th scope="col">Alias</th>
						<th scope="col">Titre</th>
						<th scope="col"></th>
			
					</tr>
				</thead>
				<c:forEach items="${ListNiveau}" var="n">
					<tr>
						<td><a href="${pageContext.request.contextPath}/cadre/filiere/get/${n.filiere.idFiliere}"><c:out value="${n.filiere.titreFiliere}" /></a></td>
						<td><c:out value="${n.idNiveau}" /></td>
						<td><c:out value="${n.alias}" /></td>
						<td><c:out value="${n.titre}" /></td>

						<td>
							<ul>
								<li><a  href="${pageContext.request.contextPath}/cadre/niveau/get/${n.idNiveau}">Plus d'information</a></li>
								<li data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="GetId(id)" id="${n.idNiveau}"><a href="#">Supprimer</a></li>

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
</body>
<script>

	var path = "<%=path%>"
	var idniveau = null
	let confirm = document.querySelector("#supprimer")
	confirm.addEventListener('click',()=>{
		location.replace(path+"/cadre/niveau/delete/"+idniveau)
    })
    
    function GetId(id){
		idniveau = id
	}
    
</script>
</html>