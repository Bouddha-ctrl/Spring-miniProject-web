<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<%
	String path = request.getContextPath();
%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" 
	crossorigin="anonymous"/>

<link type="text/css" rel="stylesheet" href="<c:url value="/resources/theme1/css/style.css" />" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		
		
		<br/><br/>
		
		<h3>Ajout d'un niveau</h3>
		<br/>
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
		<br/>
		<div>
			<h3>Liste des niveaux</h3>
		</div>
		
		
	</div>
</body>
</html>