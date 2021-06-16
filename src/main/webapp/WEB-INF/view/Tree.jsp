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
		    <a class="nav-link" href="${pageContext.request.contextPath}/cadre/module/list">Module</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/cadre/matiere/list">Matiere</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="">Tree</a>
		  </li>
		</ul>

		<br/>
		
		<h3>Arbre pedagogique</h3>
		<br/>
		
		<table class="table">
				<thead>
					<tr>
						<th scope="col">Id Filiere</th>
						<th scope="col">Id Niveau</th>
						<th scope="col">id Module</th>
						<th scope="col">id Matiere</th>
			
					</tr>
				</thead>
				<c:forEach items="${ListFiliere}" var="f">
					
						<td><a href=""><c:out value="${f.idFiliere}" /></a></td>
					</tr>

				</c:forEach>

			</table>
			
			<form name="fileUpload" method="POST" action="${pageContext.request.contextPath}/cadre/uploadFile" enctype="multipart/form-data">
				 <label>Select File</label> <br />
				 <input type="file" name="file" />
				 <input type="submit" name="submit" value="Upload" />
			</form>
	</div>
</body>
</html>