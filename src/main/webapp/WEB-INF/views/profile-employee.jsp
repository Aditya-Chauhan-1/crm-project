<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Employee</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 5 links starts -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap 5 links ends -->

<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	
	<jsp:include page="header-employee.jsp" />
	
	<div class="container mt-3">
		<h2>Hello : ${session_employee.getName()}</h2>
		<h4>Email : ${session_employee.getEmail()}</h4>
		<h4>Phone No. : ${session_employee.getPhoneno()}</h4>
		
		
	</div>

</body>
</html>