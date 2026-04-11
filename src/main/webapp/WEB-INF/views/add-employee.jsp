<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-Employee</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

	<jsp:include page="header-admin.jsp" />


	<div class="container-fluid">
		<div class="container">
			
			<c:if test="${not empty model_succes}">
				${model_succes}
			</c:if>
			<c:if test="${not empty model_errors}">
				${model_errors}
			</c:if>
			
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 bg-light login_div_design">

					<h2>Register Employee</h2>
					<form:form action="addEmpForm" method="post" modelAttribute="modelEmplAttr">
					
						<div class="mb-3">
							<label class="form-label">Enter Name</label>
							<form:input path="name" cssClass="form-control" />
 							<form:errors path="name" cssClass="error_message_design" />
		 				</div>
						<div class="mb-3">
							<label class="form-label">Enter Email</label> 
							<form:input path="email" cssClass="form-control" />
    						<form:errors path="email" cssClass="error_message_design" />
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Password</label> 
							<form:password path="password" cssClass="form-control" />
 							<form:errors path="password" cssClass="error_message_design" />
 						</div>
						<div class="mb-3">
							<label class="form-label">Enter Phone No.</label> 
							<form:input path="phoneno" cssClass="form-control" />
 							<form:errors path="phoneno" cssClass="error_message_design" />
 						</div>
						<input type="submit" value="Register" class="btn btn-primary">
					</form:form>

				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</div>

</body>
</html>