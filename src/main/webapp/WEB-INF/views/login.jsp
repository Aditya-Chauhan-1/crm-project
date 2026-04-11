<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Login Page</title>
		<meta charset="UTF-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- bootstrap 5 links starts -->
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<!-- bootstrap 5 links ends -->
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		
	</head>
	<body>
		
		<jsp:include page="header-crm.jsp" />
		
			
		<div class="container-fluid">
			<div class="container">
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4 bg-light login_div_design">
					<c:if test="${not empty model_error}">
						<h5 style="color:red">${model_error}</h5>
					</c:if>
					
					<br>
						<form action="loginForm" method="post">
							<h3>Login Here</h3> <br/>
						<div class="mb-3">
							<label class="form-label">Enter Email</label>
							<input type="text" name="email" class="form-control"/>
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Password</label>
							<input type="password" name="password" class="form-control"/>
							<div class="form-text" style="color:green;">We Will not share your email id with anyone....</div>
						</div>
						<input type="submit" value="Login" class="btn btn-primary">
						</form>
					</div>
					<div class="col-4"></div>
				</div>
			</div>
		</div>
		
	</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Login Page</title>
		<meta charset="UTF-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- bootstrap 5 links starts -->
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<!-- bootstrap 5 links ends -->
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		
	</head>
	<body>
		
		<jsp:include page="header-crm.jsp" />
		
		<%
			String login_error =  (String)request.getAttribute("model_error");	
		%>
		
		<div class="container-fluid">
			<div class="container">
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4 bg-light login_div_design">
					<%
						if(login_error != null){
							%>
								<h5 style="color:red"><%=login_error%></h5>
							<%
						}
					%>
					<br>
						<form action="loginForm" method="post">
							<h3>Login Here</h3> <br/>
						<div class="mb-3">
							<label class="form-label">Enter Email</label>
							<input type="text" name="email" class="form-control"/>
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Password</label>
							<input type="password" name="pass" class="form-control"/>
							<div class="form-text" style="color:green;">We Will not share your email id with anyone....</div>
						</div>
						<input type="submit" value="Login" class="btn btn-primary">
						</form>
					</div>
					<div class="col-4"></div>
				</div>
			</div>
		</div>
		
	</body>
</html> --%>