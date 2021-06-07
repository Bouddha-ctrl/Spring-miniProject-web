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
	

<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link "  href="${pageContext.request.contextPath}/cadre/filiere/list">Filiere</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link "  href="${pageContext.request.contextPath}/cadre/niveau/list">Niveau</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link "  href="${pageContext.request.contextPath}/cadre/module/list">Module</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="">Matiere</a>
		  </li>
		  
		</ul>


		<br/>
		<div>
			<h3>Liste des matieres</h3>
		</div>

		<div>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">titre Module</th>
						<th scope="col">Id Matiere</th>
						<th scope="col">Nom</th>
						<th scope="col">code</th>
						<th scope="col"></th>
			
					</tr>
				</thead>
				<c:forEach items="${ListMatiere}" var="m">
					<tr>
						<td><a href="${pageContext.request.contextPath}/cadre/module/get/${m.module.idModule}"><c:out value="${m.module.titre}" /></a></td>
						<td><c:out value="${m.idMatiere}" /></td>
						<td><c:out value="${m.nom}" /></td>
						<td><c:out value="${m.code}" /></td>

						<td>
							<ul>
								<li><a  href="${pageContext.request.contextPath}/cadre/matiere/get/${m.idMatiere}">Plus d'information</a></li>
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
</body>
<script>

	var path = "<%=path%>"
	var idmatiere = null
	let confirm = document.querySelector("#supprimer")
	confirm.addEventListener('click',()=>{
		location.replace(path+"/cadre/matiere/delete/"+idmatiere)
    })
    
    function GetId(id){
		idmatiere = id
	}
    
</script>
</html>