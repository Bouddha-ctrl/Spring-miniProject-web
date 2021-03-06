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

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" 
	crossorigin="anonymous"/>
<!-- Bootstrap -->

<!-- local css -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/theme1/css/style.css" />" />
<!-- local css -->

<title>Insert title here</title>
</head>
<body>

	<div class="container">

		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link " aria-current="page" href="${pageContext.request.contextPath}/cadre/filiere/list">Filiere</a>
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
				La filiere 	
				<button id="modify" type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#modiferModal" data-bs-whatever="@fat">Modifier</button>
			</h3>			
			<table>
			 <tr><td>Id </td><td> : ${FiliereModel.idFiliere}</td></tr>
			 <tr><td>Titre </td><td> : ${FiliereModel.titreFiliere}</td></tr>
			 <tr><td>Code </td><td> : ${FiliereModel.codeFiliere}</td></tr>
			 <tr><td>Annee d'accreditation </td><td> : ${FiliereModel.anneeaccreditation}</td></tr>
			 <tr><td>Annee fin d'accreditation </td><td> : ${FiliereModel.anneeFinaccreditation}</td></tr>
			</table>
		</div>
		
		<br/>
		
			<hr class="line1">		
		
		<!-- Pills navs -->
		<ul class="nav nav-pills mb-3 justify-content-center" id="pills-tab" role="tablist">
		  
		  <li class="nav-item " role="presentation">
		  
			    <button class="btn btn-outline-primary active" id="pills-niveau-tab" data-bs-toggle="pill" data-bs-target="#pills-niveau" type="button" role="tab" aria-controls="pills-niveau" aria-selected="true">Niveau</button>
			    <button class="btn btn-outline-primary " id="pills-coordination-tab" data-bs-toggle="pill" data-bs-target="#pills-coordination" type="button" role="tab" aria-controls="pills-coordination" aria-selected="false">Coordination</button>
		  </li>
		</ul>
		<!-- Pills navs -->
		
			<hr class="line1">		
		
		<!-- Pills content -->
		<div class="tab-content" id="pills-tabContent">
		  <div class="tab-pane fade show active" id="pills-niveau" role="tabpanel" aria-labelledby="pills-niveau-tab">
		  <h3>Ajout d'un niveau</h3>
			
			<f:form class="row g-3" method="POST" action="${pageContext.request.contextPath}/cadre/niveau/add" modelAttribute="Niveau_Model">
				  
				  <div class="col-md-4">
				    <label  class="form-label">Id Filiere</label>
				    <f:input type="text" name="idfiliere" class="form-control" path="" value="${FiliereModel.idFiliere}" readonly="true"/>
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
				
				  	
				  <div class="col-12">
				    <button class="btn btn-primary" type="submit">Ajouter</button>
				  </div>
			</f:form>
			
			<hr class="dotedline">		
			
			<div>
				<h3>Liste des niveaux</h3>
			</div>
	
			<div>
	
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id Niveau</th>
							<th scope="col">Alias</th>
							<th scope="col">Titre</th>
							<th scope="col"></th>
				
						</tr>
					</thead>
					<c:forEach items="${FiliereModel.niveaux}" var="n">
						<tr>
							<td><c:out value="${n.idNiveau}" /></td>
							<td><c:out value="${n.alias}" /></td>
							<td><c:out value="${n.titre}" /></td>
	
							<td>
								<ul>
									<li><a href="${pageContext.request.contextPath}/cadre/niveau/get/${n.idNiveau}">Plus d'information</a></li>
									<li data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="GetId(id,`niveau`)" id="${n.idNiveau}"><a href="#">Supprimer</a></li>
	
								</ul>
							</td>
	
						</tr>
	
					</c:forEach>
	
				</table>
			</div>
		  </div>
		  
		  <div class="tab-pane fade" id="pills-coordination" role="tabpanel" aria-labelledby="pills-coordination-tab">
		  <h3>Ajout d'une coordination</h3>
			
			<f:form class="row g-3" method="POST" action="${pageContext.request.contextPath}/cadre/coordination/add" modelAttribute="Coordination_Model">
				  
				  <div class="col-md-4">
				    <label  class="form-label">Id Filiere</label>
				    <f:input type="text" name="idfiliere" class="form-control" path="idfiliere" value="${FiliereModel.idFiliere}" readonly="true"/>
				  </div>
				  <div class="col-md-4">
				    <label  class="form-label">Id Enseignant</label>
				    <f:select class="form-select" path="idenseignant" >
				   	 	<c:forEach items="${ListEnseignant}" var="e">
				    		<f:option value="${e.idUtilisateur}" />
				    	</c:forEach>
				    </f:select>
				  </div>
				  <div class="col-md-4">
				    <label  class="form-label">Date Debut</label>
				    <f:input type="text" placeholder="01-01-1999" class="form-control" path="dateDebut" />
				    <f:errors path="dateDebut" class="error"/>
				  </div>
				  
				  <div class="col-md-4">
				    <label  class="form-label">Date Fin</label>
				    <f:input type="text" placeholder="01-01-2000" class="form-control" path="dateFin" />
				    <f:errors path="dateFin" class="error"/>
				  </div>
				
				  <div class="col-12">
				    <button class="btn btn-primary" type="submit">Ajouter</button>
				  </div>
			</f:form>
			
			<hr class="dotedline">		

			<div>
				<h3>Liste des coordinations</h3>
			</div>
	
			<div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id Coordination</th>
							<th scope="col">Date D??but</th>
							<th scope="col">Date Fin</th>
							<th scope="col">Id Enseignant</th>
							<th scope="col"></th>
				
						</tr>
					</thead>
					<c:forEach items="${FiliereModel.periodeCoordination}" var="p">
						<tr>
							<td><c:out value="${p.idCoordination}" /></td>
							<td><c:out value="${p.dateDebut}" /></td>
							<td><c:out value="${p.dateFin}" /></td>
							<td><a href="" ><c:out value="${p.coordonateur.idUtilisateur}" /></a></td>
	
							<td>
								<ul>
									<li data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="GetId(id,`coordination`)" id="${p.idCoordination}"><a href="#">Supprimer</a></li>
	
								</ul>
							</td>
	
						</tr>
	
					</c:forEach>
	
				</table>
			</div>
		  </div>
		</div>
		
		<!-- Pills content -->
		
		
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
	
	<!-- Modal Modification -->
	<div class="modal" id="modiferModal" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	        <f:form name="modifyForm" id="modifyForm"  action="${pageContext.request.contextPath}/cadre/filiere/update" class="row g-3" method="POST"  modelAttribute="UpdateFiliereModel">
	      
	      	   <div class="modal-body">
			  
				  <div class="col-md-6">
					<label  class="form-label">Id Filiere</label>
				    <f:input type="text" class="form-control" path="idFiliere" readonly="true"/>
				  </div>
				  
				  <div class="col-md-6">
				    <label  class="form-label">Titre</label>
				    <f:input type="text" class="form-control" path="titreFiliere" />
				    <f:errors path="titreFiliere" class="error"/>
				  </div>
				  
				  <div class="col-md-6">
				    <label  class="form-label">Code</label>
				    <f:input type="text" class="form-control" path="codeFiliere" />
				    <f:errors path="codeFiliere" class="error"/>
				  </div>
					        
				  <div class="col-md-6">
				    <label  class="form-label">Annee d'accreditation</label>
				    <f:input type="text" class="form-control" path="anneeaccreditation" />
				    <f:errors path="anneeaccreditation" class="error"/>
				  </div>		
				  
				  <div class="col-md-6">
				    <label  class="form-label">Annee fin d'accreditation</label>
				    <f:input type="text" class="form-control" path="anneeFinaccreditation" />
				    <f:errors path="anneeFinaccreditation" class="error"/>
				  </div>
				  		
				  
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
<script path="<%=path%>"src="<c:url value="/resources/theme1/js/file1.js" />"></script>

</body>
</html>